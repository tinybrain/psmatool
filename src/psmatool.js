#!/usr/bin/env node --harmony
import * as process from 'process'
import { Command } from 'commander'

import { AppContext } from './common/app-context';

const command = new Command()

command
  .description('Tools for managing PSMA datasets')

command
  .command('showconfig')
  .alias('c')
  .description('Shows the config')
  .action(opts => {
    const app = new AppContext(opts)
    console.log(app.config)
  })

command
  .command('db [command]', 'Basic DB tools')
  .command('admin-bdys-raw [command]', 'Load PSMA admin boundaries')
  .command('gnaf-raw [command]', 'Load PSMA G-NAF')

if (!process.argv.slice(2).length) {
  command.outputHelp()
  process.exit()
}
command.parse(process.argv)
