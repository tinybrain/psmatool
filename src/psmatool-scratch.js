#!/usr/bin/env node -r esm --no-warnings
import * as process from 'process'
import { Command } from 'commander'

import { promisify } from 'util'

const Cursor = require('pg-cursor')

import { AppContext } from './common/app-context'

const command = new Command()

command
  .description('Scratch')

command
  .command('cursor')
  .description('Iterate with cursor')

  .action(opts => {
    (async () => {
      const app = new AppContext(opts)

      console.info('bang!')

      const client = await app.db.pool.connect()
      const cursor = client.query(new Cursor('select * from gnaf.address'))
      const pc = promisify(cursor.read.bind(cursor))

      let total = 0;

      async function* resultGenerator(pcr) {
        const count = 1000
        while (true) {
          const result = await pcr(count)

          if (result.length > 0) {
            yield result
          } else {
            return
          }
        }
      }

      for await (const result of resultGenerator(pc)) {
        total += result.length
        console.log(total)
      }

      cursor.close(() => {
        client.end()
      })

      app.end()
      console.info('end!')
    })()
    .catch(e => console.error(e.stack))
  })

if (!process.argv.slice(2).length) {
  command.outputHelp()
  process.exit()
}
command.parse(process.argv)
