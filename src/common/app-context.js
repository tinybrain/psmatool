import * as path from 'path'
import * as process from 'process'
import * as fs from 'fs'
import _ from 'lodash'
import * as yaml from 'js-yaml'

import { DbContext } from './db'

export class AppContext {

  constructor(opts, states = null) {
    this.opts = opts

    // eslint-disable-next-line no-undef
    this.appDir = path.resolve(__dirname, '../../')

    const cfgPath = path.join(this.appDir, 'config', 'psmatool-default.yml')
    this.config = yaml.safeLoad(fs.readFileSync(cfgPath, 'utf8'))

    if (process.platform == 'win32') {
      this.config.data = this.config.data_win
      delete this.config.data_win
    }

    if (states && states.length > 0)
      this.config.states = _.map(states, s => s.toLowerCase())

    this.statesFilter = [... this.config.states, 'authority_code']

    this.db = new DbContext(this)
  }

  end() {
    this.db.pool.end()
  }
}