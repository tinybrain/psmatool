import { AppContext } from '../common/app-context';
import * as db from '../common/db'

export async function showConfig(opts) {
  const app = new AppContext(opts)

  console.log('--- config ---')
  console.log(app.config)

  const pgc = await app.pool.connect()

  try {
    const pgisres = await pgc.query('SELECT PostGIS_full_version()')
    let ga = parsePostGISVersions(pgisres.rows[0].postgis_full_version)

    console.log('--- postgres/postgis ---')
    console.log(ga)

  } finally {
    pgc.release()
  }

  app.end()
}

export async function ensurePostGIS(opts) {
  console.log('Ensuring postgis')

  const app = new AppContext(opts)
  const query = 'CREATE EXTENSION IF NOT EXISTS postgis'
  const res = await db.query(app, query)
  console.log(res)

  app.end()
}

function parsePostGISVersions(sourceString) {
  let re = /(?<name>[A-Z]*)="(?<value>[^"]*)"/g
  let m
  let res = {}

  while ((m = re.exec(sourceString)) != null) {
    let k = m.groups.name.toLowerCase()
    let v = /^[^0-9]*(?<ver>[0-9.]+)*/g.exec(m.groups.value).groups.ver
    res[k] = v
  }

  return res
}

