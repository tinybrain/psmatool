import { Pool, Client } from 'pg'
import * as path from 'path'
import * as process from 'process'
import * as fs from 'fs'

export class AppContext {

  config: any
  pool: Pool
  opts: any

  constructor(opts: any) {
    this.opts = opts

    const cfgPath = path.join(process.cwd(), 'config', 'psmatool-default.json');
    this.config = JSON.parse(fs.readFileSync(cfgPath, 'utf8'))

    this.pool = new Pool(this.config.pg)
  }

  end() {
    this.pool.end()
  }

  client() {
    return new Client(this.config.pg)
  }
}