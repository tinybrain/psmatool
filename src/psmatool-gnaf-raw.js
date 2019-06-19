#!/usr/bin/env node --harmony
import * as process from 'process'
import { Command } from 'commander'

import * as db from './common/db'
import { AppContext } from './common/app-context'
import { PsvImport } from './common/psv-import'

const command = new Command()

command
  .description('Load PSMA G-NAF')

command
  .command('drop')
  .alias('d')
  .description('Drop the gnaf_raw schema')

  .action(() => {
    (async () => {
      const app = new AppContext()
      await db.dropSchema(app, 'gnaf_raw')
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
      await db.createSchema(app, 'gnaf_raw')
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
        await db.dropSchema(app, 'gnaf_raw')
        await db.createSchema(app, 'gnaf_raw')

        await db.executeSqlFile(app, 'gnaf_raw', 'create_tables.sql', {
          split: 'none'
        })

        if (!opts.skipData) {
          const psv = new PsvImport(app)
          await psv.collectFiles()
          await psv.load()
        }

        await db.executeSqlFile(app, 'gnaf_raw', 'add_indexes.sql')
        await db.executeSqlFile(app, 'gnaf_raw', 'add_pkeys.sql')
        await db.executeSqlFile(app, 'gnaf_raw', 'add_fkeys.sql')

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
