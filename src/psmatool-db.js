#!/usr/bin/env node -r esm --no-warnings
import * as process from 'process'
import { Command } from 'commander'

import { AppContext } from './common/app-context';

const command = new Command()

command
  .description('Basic DB functions')

command
  .command('versions')
  .alias('v')
  .description('Show postgres/postgis versions')
  .action(opts => {
    (async () => {
      const app = new AppContext(opts)

      try {
        let pgv = await app.db.getVersions(app)
        console.log(pgv)
      } finally {
        app.end()
      }
    })().catch(e => console.log(e.stack))
  })

command
  .command('ensure-postgis')
  .description('Show the config')
  .action(opts => {
    (async () => {
      const app = new AppContext(opts)

      try {
        console.log('Ensuring postgis')
        const query = 'CREATE EXTENSION IF NOT EXISTS postgis'
        await app.db.query(query)
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