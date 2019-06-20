# psmatool

Tools for loading and processing PSMA Administrative Boundaries and G-NAF datasets.

Based on the python tools: https://github.com/minus34/gnaf-loader.

## Installation

Requires Node 10.x and Postgres/PostGIS

```console
$ npm i
$ npm link

$ psmatool
$ psmatool db
$ psmatool admin-bdys-raw
$ psmatool gnaf-raw
```

On Windows, Commander.js doesn't deal with subcommands shebangs thoroughly, so `npm link` installs separate bins in ```AppData\Roaming\npm```, i.e.:

```console
$ psmatool-admin-bdys-raw -h
```

To execute a command directly (i.e. debugging in vscode):

```console
$ node -r esm --no-warnings src/psmatool-gnaf-raw.js
```

## Config

The config in `config/psmatool-default.yml` should be self explanatory. The tool doesn't create the db, so it needs to be created and configured.

```console
$ createdb -U postgres psma_dev
Password:

$ psmatool config
{ pg:
   { host: 'localhost',
     port: 5432,
     user: 'postgres',
     password: 'password',
     database: 'psma_dev' },
  data:
   { adminBdysPath:
      '/Users/sid/Development/Data/psma/MAY19_AdminBounds_ESRIShapefileorDBFfile_20190520202351',
     gnafPath:
      '/Users/sid/Development/Data/psma/MAY19_GNAF_PipeSeparatedValue_20190521155815' },
  states: [ 'nsw', 'vic', 'qld', 'sa', 'wa', 'tas', 'nt', 'ot' ] }

$ psmatool db ensure-postgis
Ensuring postgis

$ psmatool db versions
{ postgis: '2.5.2',
  pgsql: '110',
  geos: '3.7.0',
  proj: '4.9.3',
  gdal: '2.2.4',
  libxml: '2.7.8',
  libjson: '0.12',
  libprotobuf: '1.2.1' }
```


## Usage

There are three main commands: `drop`, `create` and `load`. `create` just makes an empty schema, whereas `load` with `--skip-data` will create empty table structures.

Because of the order of applying imports and constraints, `load` does a `drop` and `create` each time, so you can't load states incrementally.

Load the table structure:

```console
$ psmatool gnaf-raw load -s
```

Individual states:

```console
$ psmatool admin-bdys-raw load qld vic act
```

All of the things:

```console
$ time psmatool admin-bdys-raw l -v && time psmatool gnaf-raw l -v
```
