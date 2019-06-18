// const { spawn } = require('child_process')
// import { spawn } from 'child_process'

import { exec } from 'child_process'
import * as util from 'util'

const exec_p = util.promisify(exec)
// const util = require('util')
// const exec = util.promisify(require('child_process').exec)

// async function main_() {

//   // const child = spawn('ls', ['-lah', '/Volumes/Trek/Trek/Star\ Trek/Season\ 1']);
//   const child = spawn('cat', ['/Users/sid/Development/Data/psma/MAY19_GNAF_PipeSeparatedValue_20190521155815/G-NAF/G-NAF\ MAY\ 2019/Standard/NT_ADDRESS_DETAIL_psv.psv'])

//   child.on('exit', code => {
//     console.log(`exit code is ${code}`)
//   })

//   for await (const data of child.stdout) {
//     console.log(`stdout from the child: ${data}`);
//   };
// }

async function execTest() {
  let cmd = 'cat "/Users/sid/Development/Data/psma/MAY19_GNAF_PipeSeparatedValue_20190521155815/G-NAF/G-NAF MAY 2019/Standard/NT_ADDRESS_DETAIL_psv.psv" | wc -l'
  const { stdout, stderr } = await exec_p(cmd)

  if (stderr) {
    console.error(stderr)
  }

  console.log(`recs: ${stdout}`)
}

execTest()