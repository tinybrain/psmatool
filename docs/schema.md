id
type

components
    building

    lot
        text
        prefix
        number
        suffix

    flat
        text
        type_code
        type
        prefix
        number
        suffix

    level
        text
        search
        type_code
        type
        prefix
        number
        suffix

    street_number
        text
        first_prefix
        first
        first_suffix
        last_prefix
        last
        last_suffix

    street
        text
        name
        type_code
        type

    locality
        text

    state

    postcode []?

ref
    address
    street
    locality
    state

    primary
    aliases []

search
    full
    ...

geometry
    point
