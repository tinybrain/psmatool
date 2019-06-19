#!/usr/bin/env node --harmony
import { Command } from 'commander'
import * as process from 'process'

const command = new Command()

command
  .version('dev')
  .description('Tools for managing PSMA datasets')

command
  .command('util [command]', 'Show info')
  .command('admin-bdys-raw [command]','Load PSMA admin boundaries')
  .command('gnaf-raw [command]','Load PSMA G-NAF')

if(!process.argv.slice(2).length) {
    command.outputHelp()
    process.exit()
}
command.parse(process.argv)
