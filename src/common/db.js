import * as sqlutils from './sqlutils'
import _ from 'lodash'
import asyncPool from 'tiny-async-pool'

export async function query(app, q) {
  const pgc = await app.pool.connect()
  let res
  try {
    res = await pgc.query(q)
  } finally {
    pgc.release()
  }
  return res
}

export async function dropSchema(app, schema) {
  console.log(`Dropping schema ${schema}`)

  const q = `DROP SCHEMA IF EXISTS ${schema} CASCADE`
  return await query(app, q)
}

export async function createSchema(app, schema) {
  console.log(`Creating schema ${schema}`)

  const q = `CREATE SCHEMA IF NOT EXISTS ${schema}`
  return await query(app, q)
}

export async function executeSqlFile(app, schema, filename,
  options = {
    split: 'statements'
  }) {

  console.log(`Executing sql/${schema}/${filename}, split: ${options.split}`)

  let sql = sqlutils.readSqlFile(schema, filename)
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
      pool: app.pool,
      query: q
    }
  })

  await asyncPool(10, tasks, await poolQueryWorker)

  // for (let query of queries) {
  //   let dbc = await app.pool.connect()
  //   await dbc.query(query)
  //   await dbc.release()
  // }
}

export async function poolQueryWorker(task) {
  let dbc = await task.pool.connect()
  await dbc.query(task.query)
  await dbc.release()
}