## Default behavior of parsers (=strict)

By default, ZodArt parsers operate in **strict mode**. This means they will only accept input values that **match the expected type exactly**. Any type mismatch will result in a **ParseError**.
The only exception is **ZObject**, which strictly accepts only `Map<String, dynamic>` as input.

| →Parse From (input),<br> ↓Parse To | List | bool | DateTime | double | int | Map<String, dynamic> | String | others |
| ---------------------------------- | ---- | ---- | -------- | ------ | --- | -------------------- | ------ | ------ |
| ZArray                             | ✅   | ❌   | ❌       | ❌     | ❌  | ❌                   | ❌     | ❌     |
| ZBool                              | ❌   | ✅   | ❌       | ❌     | ❌  | ❌                   | ❌     | ❌     |
| ZDateTime                          | ❌   | ❌   | ✅       | ❌     | ❌  | ❌                   | ❌     | ❌     |
| ZDouble                            | ❌   | ❌   | ❌       | ✅     | ❌  | ❌                   | ❌     | ❌     |
| ZInt                               | ❌   | ❌   | ❌       | ❌     | ✅  | ❌                   | ❌     | ❌     |
| ZObject                            | ❌   | ❌   | ❌       | ❌     | ❌  | ✅                   | ❌     | ❌     |
| ZString                            | ❌   | ❌   | ❌       | ❌     | ❌  | ❌                   | ✅     | ❌     |

## Parsing with coertion parameter (coertion: true)

> **Note:** Coercion support will be implemented in future versions. For now, when parsing data from forms or loosely typed sources, please use explicit transformation chains, e.g. `ZString().toInt()`.

When the coercion option is enabled, ZodArt will attempt to convert compatible input values **automatically**, if there's **no risk of data loss**.

- ✅ `int` → `double` is allowed (safe upcast)
- ❌ `double` → `int` is not allowed (precision loss risk)
- ⚠️ `Strings` will be parsed using Dart's native `.parse()` methods (e.g., `int.parse`, `DateTime.parse`)

**This is especially useful for form data or serialized values.**

| →Parse From (input),<br> ↓Parse To | List | bool | DateTime | double | int | Map<String, dynamic> | String                                 | others |
| ---------------------------------- | ---- | ---- | -------- | ------ | --- | -------------------- | -------------------------------------- | ------ |
| ZArray                             | ✅   | ❌   | ❌       | ❌     | ❌  | ❌                   | ❌                                     | ❌     |
| ZBool                              | ❌   | ✅   | ❌       | ❌     | ❌  | ❌                   | ⚠️ `true` / `false` (case-insensitive) | ❌     |
| ZDateTime                          | ❌   | ❌   | ✅       | ❌     | ❌  | ❌                   | ⚠️`DateTime.parse`                     | ❌     |
| ZDouble                            | ❌   | ❌   | ❌       | ✅     | ✅  | ❌                   | ⚠️`double.parse`                       | ❌     |
| ZInt                               | ❌   | ❌   | ❌       | ❌     | ✅  | ❌                   | ⚠️`int.parse`                          | ❌     |
| ZObject                            | ❌   | ❌   | ❌       | ❌     | ❌  | ✅                   | ❌                                     | ❌     |
| ZString                            | ❌   | ❌   | ❌       | ❌     | ❌  | ❌                   | ✅                                     | ❌     |
