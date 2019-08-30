import { Client } from '@elastic/elasticsearch'
import _ from 'lodash'

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

  async indexGnafRows(rows) {

    let commands = _
      .chain(rows)
      .map(r => [{ index: {_index: 'gnaf', _id: r.id } }, r])
      .flatten()
      .value()

    let res = await this.client.bulk({
      body: commands
    })

    if (res.statusCode != 200) {
      console.error(res)
      throw new Error('Bulk index failed')
    }

    return res
  }
}