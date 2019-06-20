import * as fs from 'fs'
import * as path from 'path'
// import * as process from 'process'
import _ from 'lodash';

export function readSqlFile(app, schema, filename) {
  let fp = path.join(app.appDir, 'sql', schema, filename)
  let sql = fs.readFileSync(fp, 'utf8')
  return sql
}

export function splitComments(sql) {
  let lines = sql.split(/^--[^\n]*$/gm)

  let blocks = _
    .chain(lines)
    .reject(l => l.length == 0)
    .map(l => {
      let ol = l.replace(/\n+/g, ' ')
      let st = _.map(ol.split(';'), s => s.trim())
      return st.join(';\n')
    })
    .value()

  return blocks
}

export function splitStatements(sql) {
  let statements = sql
    .replace(/^--[^\n]*$/gm, '')
    .replace(/\n+/g, ' ')
    .replace(/\s+/g, ' ')
    .split(';')
    .map(l => l.trim())

  return statements
}