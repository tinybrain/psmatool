/* eslint-disable no-unused-vars */

import * as path from 'path'
import * as fs from 'fs'
import * as _ from 'lodash'
import asyncPool from 'tiny-async-pool'

// eslint-disable-next-line no-undef
const fg = require('fast-glob')

import * as db from './db'

export class PsvImport {

  constructor(app) {
    this.app = app
  }

  async collectFiles() {

    let globbed = await fg('**/*.psv', { cwd: this.app.config.data.gnafPath })

    this.files = _
      .chain(globbed)
      .map(f => this.makePsvInfo(f))
      .value()

    return this.files
  }

  makePsvInfo(psfPath) {
    let basename = path.basename(psfPath, '.psv')

    let re = /^(?<state>[A-Z]{2,3}|Authority_Code)_(?<table>[A-Za-z0-9_]*)_psv$/
    let m = re.exec(basename)

    return {
      path: psfPath,
      state: m.groups.state,
      table: m.groups.table.toLowerCase()
    }
  }

  async load() {
    console.log('Loading gnaf tables')

    let sf = this.app.statesFilter
    console.log(`states: ${sf.join(', ')}`)

    let tasks = _
      .chain(this.files)
      .filter(t => sf.includes(t.state.toLowerCase()))
      .map(t => _.assign(t, { app: this.app }))
      .value()

    await asyncPool(10, tasks, await loadPsv)

    // for (const psv of tasks) {
    //   if (this.app.opts.verbose)
    //     console.log(`> ${psv.state.toLowerCase()}_${psv.table}`)

    //   let fullPath = path.join(this.app.config.data.gnafPath, psv.path)

    //   let sql = `COPY gnaf_raw.${psv.table} FROM '${fullPath}' DELIMITER '|' CSV HEADER;`
    //   let res = await db.query(this.app, sql)
    // }
  }
}

async function loadPsv(task) {
  if (task.app.opts.verbose)
    console.log(`> ${task.state.toLowerCase()}_${task.table}`)

  let fullPath = path.join(task.app.config.data.gnafPath, task.path)

  let sql = `COPY gnaf_raw.${task.table} FROM '${fullPath}' DELIMITER '|' CSV HEADER;`
  let res = await db.query(task.app, sql)
}
