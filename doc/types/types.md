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

        + refine(refiner, message?, code?) [done]
    }

    class ZObject~T~ {
        + nullable() ZNullableObject [done]
        + optional() ZNullableObject [done]

        + refine(refiner, message?, code?) [done]
    }

    class ZBool {
        + nullable() ZNullableBool [done]
        + optional() ZNullableBool [done]

        + refine(refiner, message?, code?) [done]
    }

    class ZDateTime {
        + nullable() ZNullableDateTime [done]
        + optional() ZNullableDateTime [done]

        + refine(refiner, message?, code?) [done]
    }

    class ZInt {
        + nullable() ZNullableInt [done]
        + optional() ZNullableInt [done]

        + min(min) [done]
        + max(max) [done]

        + refine(refiner, message?, code?) [done]
    }

    class ZDouble {
        + nullable() ZNullableDouble [done]
        + optional() ZNullableDouble [done]


        + min(min) [done]
        + max(max) [done]

        + refine(refiner, message?, code?) [done]
    }

    class ZString {
        + nullable() ZNullableString [done]
        + optional() ZNullableString [done]

        + toInt() ZInt [done]
        + toDouble() ZDouble [done]

        + min(min) [done]
        + max(max) [done]

        + trim() [done]

        + refine(refiner, message?, code?) [done]
    }

    class ZNullableArray~T~ {
        + refine(refiner, message?, code?) [done]
    }

    class ZNullableObject~T~ {
        + refine(refiner, message?, code?) [done]
    }

    class ZNullableBool {
        + refine(refiner, message?, code?) [done]
    }

    class ZNullableDateTime {
        + min(min) [done]
        + max(max) [done]

        + refine(refiner, message?, code?) [done]
    }

    class ZNullableInt {
        + min(min) [done]
        + max(max) [done]

        + refine(refiner, message?, code?) [done]
    }

    class ZNullableDouble {
        + min(min) [done]
        + max(max) [done]

        + refine(refiner, message?, code?) [done]
    }

    class ZNullableString {
        + min(min) [done]
        + max(max) [done]

        + trim() [done]

        + refine(refiner, message?, code?) [done]
    }

    ZArray --|> ZBase
    ZObject --|> ZBase
    ZBool --|> ZBase
    ZDateTime --|> ZBase
    ZInt --|> ZBase
    ZDouble --|> ZBase
    ZString --|> ZBase
    ZNullableArray --|> ZBase
    ZNullableObject --|> ZBase
    ZNullableBool --|> ZBase
    ZNullableDateTime --|> ZBase
    ZNullableInt --|> ZBase
    ZNullableDouble --|> ZBase
    ZNullableString --|> ZBase

    ZString ..> ZDouble : toDouble() [done]
    ZString ..> ZDateTime : toDateTime() [done]
    ZString ..> ZInt : toInt() [done]

    ZNullableString ..> ZNullableDateTime : toDateTime() [done]
    ZNullableString ..> ZNullableDouble : toDouble() [done]
    ZNullableString ..> ZNullableInt : toInt() [done]

    ZArray ..> ZNullableArray : nullable() [done]
    ZObject ..> ZNullableObject : nullable() [done]
    ZBool ..> ZNullableBool : nullable() [done]
    ZDateTime ..> ZNullableDateTime : nullable() [done]
    ZInt ..> ZNullableInt : nullable() [done]
    ZDouble ..> ZNullableDouble : nullable() [done]
    ZString ..> ZNullableString : nullable() [done]
```
