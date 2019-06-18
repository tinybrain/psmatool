#!/usr/bin/env node --harmony

import { AppContext } from './common/app-context'
import { Command } from 'commander'
import * as db from './common/db'

const command = new Command()

command
  .version('dev')
  .description('admin-bdys-raw')

command
  .command('drop')
  .alias('d')
  .description('Drop the admin_bdys_raw schema')
  .action(opts => {
    (async () => {
      const app = new AppContext(opts)
      await db.dropSchema(app, 'admin_bdys_raw')
    })().catch(e => console.log(e.stack))
  })

command
  .command('create')
  .alias('c')
  .description('Create the admin_bdys_raw schema')
  .action(opts => {
    (async () => {
      const app = new AppContext(opts)
      await db.createSchema(app, 'admin_bdys_raw')
    })().catch(e => console.log(e.stack))
  })

if(!process.argv.slice(2).length) {
    command.outputHelp()
    process.exit()
}
command.parse(process.argv)