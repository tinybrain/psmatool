#!/usr/bin/env node -r esm
import * as process from 'process'
import { Command } from 'commander'

import * as db from './common/db'
import { AppContext } from './common/app-context'
import { ShpImport } from './common/shp-import'

const command = new Command()

command
  .description('Load PSMA admin boundaries')

command
  .command('drop')
  .alias('d')
  .description('Drop the admin_bdys_raw schema')

  .action(() => {
    (async () => {
      const app = new AppContext()
      await db.dropSchema(app, 'admin_bdys_raw')
      app.end()
    })()
    .catch(e => console.error(e.stack))
  })

command
  .command('create')
  .alias('c')
  .description('Create the admin_bdys_raw schema')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)
      await db.createSchema(app, 'admin_bdys_raw')
      app.end()
    })().catch(e => console.log(e.stack))
  })

command
  .command('load [states...]')
  .alias('l')
  .option('-s|--skip-data', 'Load the structure only')
  .option('-v|--verbose', 'Talk at length')
  .description('Load boundaries from shapefiles')
  .action((states, opts) => {
    (async () => {
      const app = new AppContext(opts, states)

      try {
        await db.dropSchema(app, 'admin_bdys_raw')
        await db.createSchema(app, 'admin_bdys_raw')

        const shp = new ShpImport(app)
        await shp.collectFiles()
        await shp.create()

        if (!opts.skipData)
          await shp.load()

        await db.executeSqlFile(app, 'admin_bdys_raw', 'fix_pkeys.sql', {
          split: 'comments'
        })
        await db.executeSqlFile(app, 'admin_bdys_raw', 'remove_strays.sql', {
          split: 'none'
        })
        await db.executeSqlFile(app, 'admin_bdys_raw', 'add_fkeys.sql')

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
