#!/usr/bin/env node --harmony
import { Command } from 'commander'

const command = new Command()

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
