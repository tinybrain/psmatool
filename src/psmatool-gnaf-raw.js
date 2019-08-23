#!/usr/bin/env node -r esm --no-warnings
import * as process from 'process'
import { Command } from 'commander'

import { AppContext } from './common/app-context'
import { PsvImport } from './common/psv-import'

const command = new Command()

command
  .description('Load PSMA G-NAF')

command
  .command('drop')
  .alias('d')
  .description('Drop the gnaf_raw schema')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)
      await app.db.dropSchema('gnaf_raw')
      app.end()
    })()
    .catch(e => console.error(e.stack))
  })

command
  .command('create')
  .alias('c')
  .description('Create the gnaf_raw schema')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)
      await app.db.createSchema('gnaf_raw')
      app.end()
    })().catch(e => console.log(e.stack))
  })

command
  .command('load [states...]')
  .alias('l')
  .option('-s|--skip-data', 'Load the structure only')
  .option('-v|--verbose', 'Talk at length')
  .description('Load gnaf tables from psv distribution')
  .action((states, opts) => {
    (async () => {
      const app = new AppContext(opts, states)

      try {
        await app.db.dropSchema('gnaf_raw')
        await app.db.createSchema('gnaf_raw')

        await app.db.executeSqlFile('gnaf_raw', 'create_tables.sql', { split: 'none' })

        if (!opts.skipData) {
          const psv = new PsvImport(app)
          await psv.collectFiles()
          await psv.load()
        }

        await app.db.executeSqlFile('gnaf_raw', 'add_indexes.sql')
        await app.db.executeSqlFile('gnaf_raw', 'add_pkeys.sql')
        await app.db.executeSqlFile('gnaf_raw', 'add_fkeys.sql')

      } catch (e) {
        console.error(e)
      } finally {
        app.end()
      }
    })().catch(e => console.log(e.stack))
  })

command
  .command('install-views')
  .alias('iv')
  .description('Load gnaf views')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)

      try {

        await app.db.executeSqlFile('gnaf_raw', 'view_state_json.sql', { split: 'none' })
        await app.db.executeSqlFile('gnaf_raw', 'view_locality_json.sql', { split: 'none' })
        await app.db.executeSqlFile('gnaf_raw', 'view_street_json.sql', { split: 'none' })

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
