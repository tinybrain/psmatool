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
  .command('build [stages...]')
  .alias('b')
  .description('Build views and temp tables')

  .action((stages, opts) => {
    (async () => {
      const app = new AppContext(opts)

      let stages = [
        // 'build_postcodes',
        'create_json_views'
      ]

      try {
        for (let i = 0;  i < stages.length; ++i) {
          await app.db.executeSqlFile('gnaf', `${stages[i]}.sql`, { split: 'none' })
        }

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
