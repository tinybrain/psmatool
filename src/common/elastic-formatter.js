export function formatGnaf(gnaf) {

  // console.info(gnaf)

  if (gnaf.type === 'address') {
    gnaf.components.lot.text = formatLotText(gnaf.components.lot)
    gnaf.components.flat.text = formatSubText(gnaf.components.flat)
    gnaf.components.level.text = formatSubText(gnaf.components.level)
    gnaf.components.number.text = formatNumberText(gnaf.components.number)
    gnaf.components.street.text = formatStreetText(gnaf.components.street)

    gnaf.text = formatFullAddressText(gnaf.components)
    gnaf.full_text = formatFullAddressText(gnaf.components, true)
  }

  return gnaf
}

function filterJoin(arr, delim = '') {
  let j = arr
    .filter(v => !(v === null || v === ''))
    .join(delim)

  return j !== '' ? j : null
}

function formatLotText(lot) {
  return filterJoin([lot.prefix, lot.number, lot.suffix])
}
function formatSubText(sub) {
  if (!sub.type_code) return null

  let fs = filterJoin([sub.prefix, sub.number, sub.suffix])
  return `${sub.type} ${fs}`
}

function formatNumberText(number) {
  let tf = filterJoin([number.first_prefix, number.first, number.first_suffix])
  let tl = filterJoin([number.last_prefix, number.last, number.last_suffix])

  return tl === null ? tf : `${tf}-${tl}`
}

function formatStreetText(street) {
  return `${street.name} ${street.type}`
}

function formatFullAddressText(components, include_building = false) {
  // lot ||  flat, level, building, number
  // street, locality, state, postcode

  // console.info(components)

  const p = components.lot.text
    ? components.lot.text
    : filterJoin([
      components.flat.text,
      components.level.text,
      components.number.text
    ], ' ')

  const s = filterJoin([
    components.street.text,
    components.locality,
    components.state,
    components.postcode
  ], ' ')

  if (include_building && components.building !== null) {
    return `${components.building}, ${p} ${s}`
  } else  {
    return `${p} ${s}`
  }
}