import * as path from 'path'
import _ from 'lodash';
import asyncPool from 'tiny-async-pool'

// eslint-disable-next-line no-undef
const fg = require('fast-glob')

export class PsvImport {

  constructor(app) {
    this.app = app
    this.gnafPath = app.config.data.gnafPath
  }

  async collectFiles() {

    let globbed = await fg('**/*.psv', { cwd: this.gnafPath })

    this.files = _
      .chain(globbed)
      .map(f => this.makePsvInfo(f))
      .value()

    return this.files
  }

  makePsvInfo(psfPath) {
    let basename = path.basename(psfPath, '.psv')

    let re = /^(?<state>[A-Z]{2,3}|Authority_Code)_(?<table>[A-Za-z0-9_]*)_psv$/
    let gp = _.mapValues(re.exec(basename).groups, v => v.toLowerCase())

    return {
      path: psfPath,
      state: gp.state,
      table: gp.table
    }
  }

  async load() {
    console.log('Loading gnaf tables')

    let sf = this.app.statesFilter
    console.log(`states: ${sf.join(', ')}`)

    let tasks = _
      .chain(this.files)
      .filter(t => sf.includes(t.state.toLowerCase()))
      .map(t => _.assign(t, {
        db: this.app.db,
        verbose: this.app.opts.verbose,
        gnafPath: this.gnafPath
      }))
      .value()

    await asyncPool(10, tasks, await loadPsv)
  }
}

async function loadPsv(task) {
  if (task.verbose)
    console.log(`> ${task.state}_${task.table}`)

  let fullPath = path.join(task.gnafPath, task.path)

  let sql = `COPY gnaf_raw.${task.table} FROM '${fullPath}' DELIMITER '|' CSV HEADER;`
  await task.db.query(sql)
}
