#!/usr/bin/env node

import { Command } from 'commander';
const command = new Command()

// const program = require('commander');

command
  .version('dev')
  .description('Bang!')

command
  .command('showconfig')
  .alias('c')
  .description('Show the config')
  .action(() => {
    console.log('oooh!')
  })

if(!process.argv.slice(2).length/* || !/[arudl]/.test(process.argv.slice(2))*/) {
    command.outputHelp()
    process.exit()
}
command.parse(process.argv)
