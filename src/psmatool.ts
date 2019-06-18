#!/usr/bin/env node --harmony
// require('source-map-support').install();

import { Command } from 'commander';
const command = new Command()

// const program = require('commander');

command
  .version('dev')
  .description('Tools for managing PSMA datasets')

command
  .command('util [command]', 'subcommand')
  .command('admin-bdys-raw [command]','subcommand')

if(!process.argv.slice(2).length) {
    command.outputHelp()
    process.exit()
}
command.parse(process.argv)
