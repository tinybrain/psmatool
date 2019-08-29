#!/usr/bin/env node -r esm --no-warnings
import * as process from 'process'
import { Command } from 'commander'
import { BatchQuery } from './common/batch-query'

import { AppContext } from './common/app-context'

const command = new Command()

command
  .description('Scratch')

command
  .command('cursor')
  .description('Iterate with cursor')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)

      const bq = new BatchQuery(app, 'select * from gnaf.address')
      bq.batch()

      app.end()
      console.info('end!')
    })()
    .catch(e => console.error(e.stack))
  })

if (!process.argv.slice(2).length) {
  command.outputHelp()
  process.exit()
}
command.parse(process.argv)
