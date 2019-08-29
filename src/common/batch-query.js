import { promisify } from 'util'
const Cursor = require('pg-cursor')

export class BatchQuery {

  constructor(app, query, count = 1000) {
    this.app = app
    this.query = query
    this.count = count
  }

  async batch() {
    const client = await this.app.db.pool.connect()
    const cursor = client.query(new Cursor(this.query))
    const pc = promisify(cursor.read.bind(cursor))
    let total = 0;

    for await (const result of resultGenerator(pc, this.count)) {
      total += result.length
      console.log(total)
    }

    cursor.close(() => {
      client.end()
    })
  }
}

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
