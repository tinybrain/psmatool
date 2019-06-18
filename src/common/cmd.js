import { spawn } from 'child_process'

export async function spawnCmd(cmd, argsv, cwd) {
  const child = spawn(cmd, argsv, { cwd: cwd, shell: true})
  const fullCmd = cmd + argsv.join(' ')

  child.on('error', err => {
    throw new Error(err)
  });

  child.on('exit', code => {
    if (code) {
      console.error(fullCmd)
      throw new Error(`spanCmd exit ${code}\n${fullCmd}`)
    }
  })

  let out = ''
  for await (const data of child.stdout) {
    out += data
  }

  return out
}
