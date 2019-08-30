import { Client } from '@elastic/elasticsearch'
import _ from 'lodash'

export class PsmaElastic {

  constructor(app) {
    this.app = app
    this.client = new Client({ node: 'http://localhost:9200' })
  }

  checkResponse(res, err) {
    if (res.statusCode != 200) {
      console.error(res)
      throw new Error(err)
    }
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

  async deleteGnafByType(type) {
    console.info(`Deleting ${type}`)
    let res = await this.client.deleteByQuery({
      index: 'gnaf',
      body: {
        query: {
          match: {
            type: type
          }
        }
      }
    })

    this.checkResponse(res, 'Delete gnaf by type error')

    console.info(`> ${res.body.deleted} deleted`)

    return res
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

    this.checkResponse(res, 'Bulk index')
    return res
  }
}