import { AppContext } from '../common/app-context';

export async function showConfig(opts: any) {
  const app = new AppContext(opts)

  console.log('--- config ---')
  console.log(app.config)

  const pgc = await app.pool.connect()

  try {
    const pgisres = await pgc.query('SELECT PostGIS_full_version()')
    let ga = parsePostGISVersions(pgisres.rows[0].postgis_full_version)

    console.log('--- postgres/postgis ---')
    console.log(ga)

  } catch (e) {
    console.error(e)
  }

  pgc.release()
  app.end()
}

function parsePostGISVersions(sourceString: string): any {
  let re = /(?<name>[A-Z]*)="(?<value>[^"]*)"/g
  let m: RegExpExecArray | null
  let matches: any[] = []
  while ((m = re.exec(sourceString)) != null) {
    matches.push(m.groups)
  }

  return matches.reduce((map: any, obj: any) => {
    let vn = /^[^0-9]*(?<ver>[0-9.]+)*/g.exec(obj.value) as any
    map[obj.name.toLowerCase()] = vn.groups.ver
    return map
  }, {})
}

