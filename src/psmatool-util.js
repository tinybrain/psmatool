#!/usr/bin/env node --harmony
import { Command } from 'commander'
import * as util from './commands/util'

const command = new Command()

command
  .version('dev')
  .description('util')

command
  .command('showconfig')
  .alias('c')
  .description('Show the config')
  .action(opts => {
    (async () => {
      await util.showConfig(opts)
    })().catch(e => console.log(e.stack))
  })

command
  .command('ensure-postgis')
  .description('Show the config')
  .action(opts => {
    (async () => {
      await util.ensurePostGIS(opts)
    })().catch(e => console.log(e.stack))
  })

if(!process.argv.slice(2).length) {
    command.outputHelp()
    process.exit()
}
command.parse(process.argv)