## Default behavior of parsing functions (=strict)

Default parsing behavior is strict and only allows parsing values of the same type as the desired output. All mismatched types result in a parse error.

| ↓ TO   | String      | int         | double      | others      |
| ------ | ----------- | ----------- | ----------- | ----------- |
| String | identity    | parse_error | parse_error | parse_error |
| int    | parse_error | identity    | parse_error | parse_error |
| double | parse_error | parse_error | identity    | parse_error |

## Parsing with coertion parameter (coertion: true)

Coercion uses the same logic as int.parse / double.parse, and will fail if the input is not a valid representation.

| ↓ TO   | String       | int      | double   | others      |
| ------ | ------------ | -------- | -------- | ----------- |
| String | identity     | toString | toString | parse_error |
| int    | int.parse    | identity | toInt    | parse_error |
| double | double.parse | toDouble | identity | parse_error |
