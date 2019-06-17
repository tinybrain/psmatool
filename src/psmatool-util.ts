#!/usr/bin/env node --harmony
// require('source-map-support').install();

console.log('hay!')

import { Command } from 'commander';
const command = new Command()

import { bang } from './commands/util/showconfig';

// const program = require('commander');

command
  .version('dev')
  .description('util')

command
  .command('showconfig')
  .alias('c')
  .description('Show the config')
  .action(o => {
    bang(o)
    console.log('oooh!')
  })

if(!process.argv.slice(2).length/* || !/[arudl]/.test(process.argv.slice(2))*/) {
    command.outputHelp()
    process.exit()
}
command.parse(process.argv)