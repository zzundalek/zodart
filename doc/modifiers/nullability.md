## ZObject Parsing (Map fields)

In Dart, unlike JavaScript, there is no concept of `undefined` value. However, when parsing a `Map<String, dynamic>`, a missing key (`!map.containsKey('key')`) is the Dart equivalent of `undefined`. To explicitly allow missing keys, ZodArt provides the `.optional()` modifier.

- `.nullable()` - allows the field value to be `null`
- `.optional()` - allows the field to be either `null` or **missing from the map**

| Field value             | `.nullable()` | `.optional()` | Result                 |
| ----------------------- | ------------- | ------------- | ---------------------- |
| null                    | ❌            | ❌            | ❌ ParseError          |
| null                    | ❌            | ✅            | ✅ ParseSuccess (null) |
| null                    | ✅            | ❌            | ✅ ParseSuccess (null) |
| null                    | ✅            | ✅            | ✅ ParseSuccess (null) |
| !map.containsKey('key') | ❌            | ❌            | ❌ ParseError          |
| !map.containsKey('key') | ❌            | ✅            | ✅ ParseSuccess (null) |
| !map.containsKey('key') | ✅            | ❌            | ❌ ParseError          |
| !map.containsKey('key') | ✅            | ✅            | ✅ ParseSuccess (null) |

## Other Types Parsing

For all other schemas like `ZString`, `ZInt`, etc., there is no concept of a "missing" value outside a `ZObject`. Values passed directly to `.parse()` are always either `null` or a `concrete value`. In this context, the `.optional()` modifier has no semantic effect and is treated as **equivalent** to `.nullable()`:

| Field value | `.nullable()` | `.optional()` | Result                 |
| ----------- | ------------- | ------------- | ---------------------- |
| null        | ❌            | ❌            | ❌ ParseError          |
| null        | ❌            | ✅            | ✅ ParseSuccess (null) |
| null        | ✅            | ❌            | ✅ ParseSuccess (null) |
| null        | ✅            | ✅            | ✅ ParseSuccess (null) |
