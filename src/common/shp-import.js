import * as path from 'path'
import * as fs from 'fs'
import * as _ from 'lodash'

// eslint-disable-next-line no-undef
const fg = require('fast-glob')

import { spawnCmd } from './cmd'
import * as db from './db'

export class ShpImport {

  constructor(app) {
    this.app = app
  }

  async collectFiles() {

    let globbed = await fg('**/*.dbf', { cwd: this.app.config.data.adminBdysPath })

    this.files = _
      .chain(globbed)
      .reject(f => f.includes('Town Points') && f.endsWith('_LOCALITY_shp.dbf'))
      .map(f => this.makeDbfInfo(f))
      .groupBy('table')
      .transform((r, v, k) => { r[k] = k.endsWith('_aut') ? [v[0]] : v }, {})
      .value()

    return this.files
  }

  makeDbfInfo(dbfPath) {
    let shpPath = dbfPath.replace(/.dbf$/, '.shp')
    let shpPathFull = path.join(this.app.config.data.adminBdysPath, shpPath)
    let format = fs.existsSync(shpPathFull) ? '.shp' : '.dbf'
    let rpath = format == '.shp' ? shpPath : dbfPath
    let basename = path.basename(rpath, format)

    let re = /^(?<state>[A-Z]{2,3}|Authority_Code)_(?<table>[A-Za-z0-9_]*)_shp$/
    let gp = _.mapValues(re.exec(basename).groups, v => v.toLowerCase())

    return {
      format: format,
      path: rpath,
      basename: basename,
      state: gp.state,
      table: gp.table
    }
  }

  async create() {
    console.log('Create tables')

    let tasks = _
      .chain(this.files)
      .map(t => t[0])
      .map(t => _.assign(t, { mode: 'p' }))
      .value()

    console.log(`(${tasks.length} files)`)

    for (const dbf of tasks) {
      if (this.app.opts.verbose)
        console.log(`> ${dbf.mode}: ${dbf.table}`)

      let sql = await this.importShapfile(dbf)
      await db.query(this.app, sql)
    }
  }

  async load() {
    console.log('Loading shapefiles')

    let sf = this.app.statesFilter
    console.log(`states: ${sf.join(', ')}`)

    let tasks = _
      .chain(this.files)
      .map(t => t)
      .flatten()
      .filter(t => sf.includes(t.state.toLowerCase()))
      .map(t => _.assign(t, { mode: 'a' }))
      .value()

    for (const dbf of tasks) {
      if (this.app.opts.verbose)
        console.log(`> ${dbf.mode}: ${dbf.state.toLowerCase()}_${dbf.table}`)

      let sql = await this.importShapfile(dbf)
      await db.query(this.app, sql)
    }
  }

  async importShapfile(dbf) {
    let args = `-${dbf.mode} -i `

    if (dbf.format === '.shp') {
      args += '-s 4328 '
      if (dbf.mode === 'p')
        args += '-I '
    } else {
      args += '-G -n '
    }

    args += `"${dbf.path}" admin_bdys_raw.${dbf.table}`
    const argsv = args.match(/(".*?"|[^"\s]+)(?=\s*|\s*$)/g)

    const sql = await spawnCmd('shp2pgsql', argsv, this.app.config.data.adminBdysPath)
    return sql
  }
  }
