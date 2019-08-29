#!/usr/bin/env node -r esm --no-warnings
import * as process from 'process'
import { Command } from 'commander'
import { BatchQuery } from './common/batch-query'
import { PsmaElastic } from './common/psma-elastic'

import { AppContext } from './common/app-context'

// const timeout = ms => {
//   return new Promise(resolve => setTimeout(resolve, ms))
// }

const command = new Command()

command
  .description('Scratch')

command
  .command('cursor')
  .description('Iterate with cursor')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)

      const bq = new BatchQuery(app, 'select * from gnaf.locality')

      let total = 0

      bq.batch(async (rows) => {
        total+= rows.length
        console.info(total)
      })

      app.end()
    })()
    .catch(e => console.error(e.stack))
  })

command
  .command('init')
  .description('Create elastic gnaf')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)

      const pe = new PsmaElastic()

      await pe.init()

      app.end()
    })()
    .catch(e => console.error(e.stack))
  })

command
  .command('index')
  .description('Bulk index')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)

      const pe = new PsmaElastic()

      const bq = new BatchQuery(app, 'select * from gnaf.street')

      let total = 0

      bq.batch(async rows => {
        total += rows.length
        console.info(total)

        // await timeout(1000)

        await pe.indexRows(rows)

        // console.info('!')

          // let res = await pe.bulk(rows)

        // console.info(res)
      })

      app.end()
    })()
    .catch(e => console.error(e.stack))
  })

if (!process.argv.slice(2).length) {
  command.outputHelp()
  process.exit()
}
command.parse(process.argv)
