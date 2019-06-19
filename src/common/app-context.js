import * as path from 'path'
import * as process from 'process'
import * as fs from 'fs'
import * as _ from 'lodash'

import { Pool } from 'pg'

export class AppContext {

  constructor(opts, states = null) {
    this.opts = opts
    this.cwd = process.cwd()

    const cfgPath = path.join(process.cwd(), 'config', 'psmatool-default.json');
    this.config = JSON.parse(fs.readFileSync(cfgPath, 'utf8'))

    if (states && states.length > 0) {
      this.config.states = _.map(states, s => s.toUpperCase())
    }

    this.statesFilter = [
      ... _.map(this.config.states, s => s.toLowerCase()),
      'authority_code'
    ]

    this.pool = new Pool(this.config.pg)
  }

  end() {
    this.pool.end()
  }
}