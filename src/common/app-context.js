import { Pool } from 'pg'
import * as path from 'path'
import * as process from 'process'
import * as fs from 'fs'

export class AppContext {

  constructor(opts) {
    console.log('AppContext()')
    this.opts = opts
    this.cwd = process.cwd()

    const cfgPath = path.join(process.cwd(), 'config', 'psmatool-default.json');
    this.config = JSON.parse(fs.readFileSync(cfgPath, 'utf8'))

    this.pool = new Pool(this.config.pg)

    console.log(this.pool)
  }

  end() {
    this.pool.end()
  }
}