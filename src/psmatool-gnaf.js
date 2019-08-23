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

command
  .command('setup')
  .alias('su')
  .description('Setup tables and views')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)

      try {

        await app.db.executeSqlFile('gnaf', 'create_json.sql', { split: 'none' })

      } catch (e) {
        console.error(e)
      } finally {
        app.end()
      }
    })().catch(e => console.log(e.stack))
  })

if (!process.argv.slice(2).length) {
  command.outputHelp()
  process.exit()
}
command.parse(process.argv)
