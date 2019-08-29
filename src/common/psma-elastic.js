import { Client } from '@elastic/elasticsearch'

export class PsmaElastic {

  constructor(app) {
    this.app = app
    this.client = new Client({ node: 'http://localhost:9200' })
  }

  async init() {
    console.info('Deleting gnaf index')
    await this.client.indices.delete({
      index: 'gnaf'
    })

    console.info('Creating gnaf index')
    await this.client.indices.create({
      index: 'gnaf'
    })
  }

  async index(row) {
    // await this.client.bulk({
    //   index: 'gnaf',
    //   body: docs
    // })

    console.info(`index > ${row.id}`)

    await this.client.create({
      id: row.id,
      index: 'gnaf',
      body: row
    })
  }

  async indexRows(rows) {

    console.info(rows.length)

    console.info(rows)

    let batch = rows.reduce((p, v) => {
      p.push({'_id': v.id})
      p.push(v)
    }, [])

    console.info(batch)

    // await this.client.bulk({

    // })

  }
}