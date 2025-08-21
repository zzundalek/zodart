```mermaid
---
title: ZodArt types
---
classDiagram
    class ZBase~T~  {
        <<Abstract>>
        + parse(val)
    }

    class ZArray~T~ {
        + min(min)
        + max(max)

        + nullable() ZNullableArray
        + optional() ZNullableArray

        + toStr(t)
        + toArray<NewType>(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZObject~T~ {
        + nullable() ZNullableObject
        + optional() ZNullableObject

        + toStr(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZBool {
        + nullable() ZNullableBool
        + optional() ZNullableBool

        + toStr(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZDateTime {
        + nullable() ZNullableDateTime
        + optional() ZNullableDateTime

        + toStr(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZInt {
        + nullable() ZNullableInt
        + optional() ZNullableInt

        + min(min)
        + max(max)

        + toDouble()

        + toStr(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZDouble {
        + nullable() ZNullableDouble
        + optional() ZNullableDouble


        + min(min)
        + max(max)

        + toInt(t)

        + toStr(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZString {
        + nullable() ZNullableString
        + optional() ZNullableString

        + toInt() ZInt
        + toDouble() ZDouble

        + min(min)
        + max(max)

        + trim()

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZNullableArray~T~ {
        + min(min)
        + max(max)

        + toStr(t)
        + toArray<NewType>(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZNullableObject~T~ {
        + toStr(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZNullableBool {
        + toStr(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZNullableDateTime {
        + min(min)
        + max(max)

        + toStr(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZNullableInt {
        + min(min)
        + max(max)

        + toDouble()

        + toStr(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZNullableDouble {
        + min(min)
        + max(max)

        + toInt(t)
        + toStr(t)

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
    }

    class ZNullableString {
        + min(min)
        + max(max)

        + trim()

        + refine(refiner, message?, code?)
        + superRefine(refiner)
        + process(p)
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

    %% toStr %%
    ZArray ..> ZString : toStr(t)
    ZObject ..> ZString : toStr(t)
    ZBool ..> ZString : toStr(t)
    ZDateTime ..> ZString : toStr(t)
    ZInt ..> ZString : toStr(t)
    ZDouble ..> ZString : toStr(t)
    ZNullableArray ..> ZNullableString : toStr(t)
    ZNullableObject ..> ZNullableString : toStr(t)
    ZNullableBool ..> ZNullableString : toStr(t)
    ZNullableDateTime ..> ZNullableString : toStr(t)
    ZNullableInt ..> ZNullableString : toStr(t)
    ZNullableDouble ..> ZNullableString : toStr(t)
    %% \toStr %%

    %% toArray %%
    ZArray ..> ZArray : toArray<NewType>(t)
    ZNullableArray ..> ZNullableArray : toArray<NewType>(t)
    %% \toArray %%

    %% toDouble %%
    ZInt ..> ZDouble : toDouble()
    ZNullableInt ..> ZNullableDouble : toDouble()
    ZString ..> ZDouble : toDouble()
    ZNullableString ..> ZNullableDouble : toDouble()
    %% \toDouble %%

    %% toInt %%
    ZDouble ..> ZInt : toInt(t)
    ZNullableDouble ..> ZNullableInt : toInt(t)
    ZString ..> ZInt : toInt()
    ZNullableString ..> ZNullableInt : toInt()
    %% \toInt %%

    %% toDateTime %%
    ZString ..> ZDateTime : toDateTime()
    ZNullableString ..> ZNullableDateTime : toDateTime()
    %% \toDateTime %%

    ZArray ..> ZNullableArray : nullable()
    ZObject ..> ZNullableObject : nullable()
    ZBool ..> ZNullableBool : nullable()
    ZDateTime ..> ZNullableDateTime : nullable()
    ZInt ..> ZNullableInt : nullable()
    ZDouble ..> ZNullableDouble : nullable()
    ZString ..> ZNullableString : nullable()
```

## Type conversions

| ⬇️From ➡️To Type             | **ZBool** | **ZInt**  | **ZDouble** | **ZDateTime** | **ZString** | **ZArray&lt;T&gt;**    | **ZObject&lt;T&gt;** | **ZNullableBool**      | **ZNullableInt**       | **ZNullableDouble**    | **ZNullableDateTime**  | **ZNullableString**    | **ZNullableArray&lt;T&gt;**        | **ZNullableObject&lt;T&gt;**     |
| ---------------------------- | --------- | --------- | ----------- | ------------- | ----------- | ---------------------- | -------------------- | ---------------------- | ---------------------- | ---------------------- | ---------------------- | ---------------------- | ---------------------------------- | -------------------------------- |
| **ZBool**                    |           |           |             |               | toStr(t)    |                        |                      | nullable(), optional() |                        |                        |                        |                        |                                    |                                  |
| **ZInt**                     |           |           | toDouble()  |               | toStr(t)    |                        |                      |                        | nullable(), optional() |                        |                        |                        |                                    |                                  |
| **ZDouble**                  |           | toInt(t)  |             |               | toStr(t)    |                        |                      |                        |                        | nullable(), optional() |                        |                        |                                    |                                  |
| **ZDateTime**                |           |           |             |               | toStr(t)    |                        |                      |                        |                        |                        | nullable(), optional() |                        |                                    |                                  |
| **ZString**                  |           | toInt()   | toDouble()  | toDateTime()  |             |                        |                      |                        |                        |                        |                        | nullable(), optional() |                                    |                                  |
| **ZArray&lt;T&gt;**          |           |           |             |               | toStr(t)    | toArray&lt;NewT&gt;(t) |                      |                        |                        |                        |                        |                        | nullable(), optional()             |                                  |
| **ZObject&lt;T&gt;**         |           |           |             |               | toStr(t)    |                        | toObj&lt;NewT&gt;(t) |                        |                        |                        |                        |                        |                                    | nullable(), optional()           |
| **ZNullableBool**            | onNull(t) |           |             |               |             |                        |                      | optional()             |                        |                        |                        | toStr(t)               |                                    |                                  |
| **ZNullableInt**             |           | onNull(t) |             |               |             |                        |                      |                        | optional()             | toDouble()             |                        | toStr(t)               |                                    |                                  |
| **ZNullableDouble**          |           |           | onNull(t)   |               |             |                        |                      |                        | toInt(t)               | optional()             |                        | toStr(t)               |                                    |                                  |
| **ZNullableDateTime**        |           |           |             | onNull(t)     |             |                        |                      |                        |                        |                        | optional()             | toStr(t)               |                                    |                                  |
| **ZNullableString**          |           |           |             |               | onNull(t)   |                        |                      |                        | toInt()                | toDouble()             | toDateTime()           | optional()             |                                    |                                  |
| **ZNullableArray&lt;T&gt;**  |           |           |             |               |             | onNull(t)              |                      |                        |                        |                        |                        | toStr(t)               | toArray&lt;NewT&gt;(t), optional() |                                  |
| **ZNullableObject&lt;T&gt;** |           |           |             |               |             |                        | onNull(t)            |                        |                        |                        |                        | toStr(t)               |                                    | toObj&lt;NewT&gt;(t), optional() |
