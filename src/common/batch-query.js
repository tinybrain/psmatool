import { promisify } from 'util'
const Cursor = require('pg-cursor')

export class BatchQuery {

  constructor(app, query, count = 1000) {
    this.app = app
    this.query = query
    this.count = count
  }

  async batch(cb) {
    const client = await this.app.db.pool.connect()
    const cursor = client.query(new Cursor(this.query))
    const pc = promisify(cursor.read.bind(cursor))

    async function* resultGenerator(pcr, count) {
      while (true) {
        const result = await pcr(count)

        if (result.length > 0) {
          yield result
        } else {
          return
        }
      }
    }

    for await (const result of resultGenerator(pc, this.count)) {
      if (cb) await cb(result)
    }

    cursor.close(() => {
      client.end()
    })
  }
}


