```mermaid
---
title: ZodArt types
---
classDiagram
    class ZBase~T~  {
        <<Abstract>>
        + parse(val) [done]
    }

    class ZArray~T~ {
        + nullable() ZNullableArray [done]
        + optional() ZNullableArray [done]
    }

    class ZObject~T~ {
        + nullable() ZNullableObject [done]
        + optional() ZNullableObject [done]
    }

    class ZBool {
        + nullable() ZNullableBool [done]
        + optional() ZNullableBool [done]
    }

    class ZInt {
        + nullable() ZNullableInt [done]
        + optional() ZNullableInt [done]

        + min(min) [done]
        + max(max) [done]
    }

    class ZDouble {
        + nullable() ZNullableDouble [done]
        + optional() ZNullableDouble [done]


        + min(min) [done]
        + max(max) [done]
    }

    class ZString {
        + nullable() ZNullableString [done]
        + optional() ZNullableString [done]

        + toInt() ZInt [done]
        + toDouble() ZDouble [done]

        + min(min) [done]
        + max(max) [done]

        + trim() [done]
    }

    class ZNullableArray~T~ {
    }

    class ZNullableObject~T~ {
    }

    class ZNullableBool {
    }

    class ZNullableInt {
        + min(min) [done]
        + max(max) [done]
    }

    class ZNullableDouble {
        + min(min) [done]
        + max(max) [done]
    }

    class ZNullableString {
        + min(min) [done]
        + max(max) [done]

        + trim() [done]
    }

    ZArray --|> ZBase
    ZObject --|> ZBase
    ZBool --|> ZBase
    ZInt --|> ZBase
    ZDouble --|> ZBase
    ZString --|> ZBase
    ZNullableArray --|> ZBase
    ZNullableObject --|> ZBase
    ZNullableBool --|> ZBase
    ZNullableInt --|> ZBase
    ZNullableDouble --|> ZBase
    ZNullableString --|> ZBase

    ZString ..> ZInt : toInt() [done]
    ZString ..> ZDouble : toDouble() [done]

    ZArray ..> ZNullableArray : nullable() [done]
    ZObject ..> ZNullableObject : nullable() [done]
    ZBool ..> ZNullableBool : nullable() [done]
    ZInt ..> ZNullableInt : nullable() [done]
    ZDouble ..> ZNullableDouble : nullable() [done]
    ZString ..> ZNullableString : nullable() [done]
```
