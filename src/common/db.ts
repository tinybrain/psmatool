import { AppContext } from './app-context'

export async function dropSchema(app: AppContext, schema: string) {
  console.log('bang')
  const client = app.client()

  try {
    const query = 'SELECT PostGIS_full_version()'
    const res = await client.query(query)
    console.log(res)
  } finally {
    client.end()
  }
}

export async function dropSchema_(app: AppContext, schema: string) {
  const pgc = await app.pool.connect()
  try {
    const query = `DROP SCHEMA IF EXISTS ${schema} CASCADE`
    const res = await pgc.query(query)
    console.log(res)
  } finally {
    pgc.release()
  }
}

export async function createSchema(app: AppContext, schema: string) {
  const pgc = await app.pool.connect()
  try {
    const query = `CREATE SCHEMA IF NOT EXISTS ${schema} AUTHORIZATION ${app.config.pg.user}`
    const res = await pgc.query(query)
    console.log(res)
  } finally {
    pgc.release()
  }
}