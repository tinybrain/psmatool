#!/usr/bin/env node --harmony
// require('source-map-support').install();

import { Command } from 'commander';
import { showConfig } from './commands/util';

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
      await showConfig(opts)
    })().catch(e => console.log(e.stack))
  })

if(!process.argv.slice(2).length) {
    command.outputHelp()
    process.exit()
}
command.parse(process.argv)