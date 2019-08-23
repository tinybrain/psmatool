#!/usr/bin/env node -r esm --no-warnings
import * as process from 'process'
import { Command } from 'commander'

import { AppContext } from './common/app-context'

const command = new Command()

command
  .description('Load PSMA G-NAF')

command
  .command('drop')
  .alias('d')
  .description('Drop the gnaf schema')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)
      await app.db.dropSchema('gnaf')
      app.end()
    })()
    .catch(e => console.error(e.stack))
  })

command
  .command('create')
  .alias('c')
  .description('Create the gnaf schema')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)
      await app.db.createSchema('gnaf')
      app.end()
    })().catch(e => console.log(e.stack))
  })

if (!process.argv.slice(2).length) {
  command.outputHelp()
  process.exit()
}
command.parse(process.argv)
