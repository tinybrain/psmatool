import { AppContext } from './app-context'

export async function query(app, q) {
  const pgc = await app.pool.connect()
  let res
  try {
    res = await pgc.query(q)
  } finally {
    pgc.release()
  }
  return res
}

export async function dropSchema(app, schema) {
  console.log(`Dropping schema ${schema}`)

  const q = `DROP SCHEMA IF EXISTS ${schema} CASCADE`
  return await query(app, q)
}

export async function createSchema(app, schema) {
  console.log(`Creating schema ${schema}`)

  const q = `CREATE SCHEMA IF NOT EXISTS ${schema}`
  return await query(app, q)
}