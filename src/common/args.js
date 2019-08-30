import _ from 'lodash'

export function checkArgs(defaults, args) {
  if (!args || args.length === 0) {
    return defaults
  }

  let diff = _.difference(args, defaults)

  if (diff.length > 0) {
    throw new Error(`Invalid arguments: ${diff.join(', ')} (Defaults: ${defaults.join(',')})`)
  }

  return args
}