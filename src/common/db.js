import * as process from 'process'
import * as sqlutils from './sqlutils'
import _ from 'lodash'
import asyncPool from 'tiny-async-pool'
import { Pool } from 'pg'


export class DbContext {

  constructor(app) {
    this.app = app
    this.pool = new Pool(app.config.pg)
  }

  async getVersions() {
    const pgc = await this.pool.connect()
    const pgisres = await pgc.query('select postgis_full_version()')

    let re = /(?<name>[A-Z]*)="(?<value>[^"]*)"/g
    let m
    let res = {}

    while ((m = re.exec(pgisres.rows[0].postgis_full_version)) != null) {
      let k = m.groups.name.toLowerCase()
      let v = /^[^0-9]*(?<ver>[0-9.]+)*/g.exec(m.groups.value).groups.ver
      res[k] = v
    }

    pgc.release()
    return res
  }

  async query(q) {
    const pgc = await this.pool.connect()
    let res
    try {
      res = await pgc.query(q)
    } finally {
      pgc.release()
    }
    return res
  }

  async dropSchema(schema) {
    console.log(`Dropping schema ${schema}`)

    const q = `drop schema if exists ${schema} cascade`
    return await this.query(q)
  }

  async createSchema(schema) {
    console.log(`Creating schema ${schema}`)

    const q = `create schema if not exists ${schema}`
    return await this.query(q)
  }

  async executeSqlFile(schema, filename,
    options = {
      split: 'statements'
    }) {

    console.log(`Executing sql/${schema}/${filename}, split: ${options.split}`)

    let hrstart = process.hrtime()

    let sql = sqlutils.readSqlFile(this.app, schema, filename)
    let queries = []

    switch (options.split) {
      case 'statements':
        queries = sqlutils.splitStatements(sql)
        break;

      case 'comments':
        queries = sqlutils.splitComments(sql)
        break;

      case 'none':
      default:
        queries = [sql]
        break;
    }

    let tasks = _.map(queries, q => {
      return {
        pool: this.pool,
        query: q
      }
    })

    await asyncPool(10, tasks, await poolQueryWorker)

    let hrend = process.hrtime(hrstart)
    console.info('>> completed in %ds %dms', hrend[0], Math.round(hrend[1] / 1000000))
  }
}

export async function poolQueryWorker(task) {
  let dbc = await task.pool.connect()
  await dbc.query(task.query)
  await dbc.release()
}