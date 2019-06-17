#!/usr/bin/env node --harmony
// require('source-map-support').install();

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

let dummy: any = {};

console.log(dummy.not_here);

dummy.barry()

if(!process.argv.slice(2).length/* || !/[arudl]/.test(process.argv.slice(2))*/) {
    command.outputHelp()
    process.exit()
}
command.parse(process.argv)
