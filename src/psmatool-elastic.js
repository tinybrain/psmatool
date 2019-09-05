#!/usr/bin/env node -r esm --no-warnings
import * as process from 'process'
import { Command } from 'commander'

import { AppContext } from './common/app-context'
import { BatchQuery } from './common/batch-query'
import { PsmaElastic } from './common/psma-elastic'
import * as ArgUtils from './common/args'

const command = new Command()

command
  .description('Elastic tools')

command
  .command('init')
  .description('Setup empty elastic gnaf index')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)

      try {
        const pe = new PsmaElastic()
        await pe.init()
      } catch (e) {
        console.error(e)
      } finally {
        app.end()
      }

    })()
    .catch(e => console.error(e.stack))
  })

command
  .command('delete [types...]')
  .alias('d')
  .description('Delete from gnaf index')

  .action((types, opts) => {
    (async () => {
      const app = new AppContext(opts)

      try {
        const pe = new PsmaElastic()
        types = ArgUtils.checkArgs(['locality', 'street', 'address'], types)

        for (let type of types) {
          await pe.deleteGnafByType(type)
        }
      } catch (e) {
        console.error(e)
      } finally {
        app.end()
      }

    })()
    .catch(e => console.error(e.stack))
  })

command
  .command('index [types...]')
  .alias('i')
  .description('Bulk index')

  .action((types, opts) => {
    (async () => {
      const app = new AppContext(opts)

      try {
        const pe = new PsmaElastic()
        // types = ArgUtils.checkArgs(['locality', 'street', 'address'], types)
        types = ArgUtils.checkArgs(['address'], types)

        for (let type of types) {

          await pe.deleteGnafByType(type)

          const countResult = await app.db.query(`select count(*) from gnaf.${type}`)
          const total = countResult.rows[0].count

          console.info(`Indexing ${type} (${total})`)

          const bq = new BatchQuery(app, `select * from gnaf.${type}`)
          let count = 0

          await bq.batch(async rows => {
            await pe.indexGnafRows(rows)
            count += rows.length
            console.info(`> ${Math.floor(100 * count / total)}% (${count}/${total})`)
          })
        }
      } catch (e) {
        console.error(e)
      } finally {
        app.end()
      }

    })()
    .catch(e => console.error(e.stack))
  })

if (!process.argv.slice(2).length) {
  command.outputHelp()
  process.exit()
}
command.parse(process.argv)
