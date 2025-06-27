// Makes no sense here...
// ignore_for_file: specify_nonobvious_property_types, avoid_print

import 'package:zodart/zodart.dart';

part 'playground.zodart.dart';

// ---------------------------------------------------------
// ----------------------- Some class ----------------------
// ---------------------------------------------------------
class MyClass {
  const MyClass(this.name, {required this.age});

  final String name;
  final int? age;

  @override
  String toString() => 'MyClass(name: $name, age: $age)';
}
// ---------------------------------------------------------
// ---------------------------------------------------------

// TODO(zzundalek): add this to doc this is just tooooo goood!
@zodart
abstract class DerivedSchema {
  static final schema = (
    myTextik: MySchema.schema.name,
  );

  static const z = _$ZDerivedSchemaUtils();
  static ZObject<({String myTextik})> get zObject => z.zObject;
}

@zodart
abstract class MyEmbeddedSchema {
  static final schema = (
    myText: ZString(),
    myInt: ZInt(),
  );

  // TODO(zzundalek): better: static ZObject<T> asZ<T>() => ZObject<T>.fromMap(_schema);
  static const z = _$ZMyEmbeddedSchemaUtils();
  static ZObject<MyClass> get zObject => z.withMapper((x) => MyClass(x.myText, age: x.myInt));
  // static ZObject<({String myText, int myInt})> get zObject => Z.zObject;
}

@zodart
abstract class MySchema {
  // Defined by user
  static final schema = (
    name: ZString().min(1).max(10),
    age: ZInt().optional(),
    obj: MyEmbeddedSchema.zObject,
  );

  // To get all the utils!
  static const z = _$ZMySchemaUtils();
}

void main() {
  final valueForParsing = {
    'name': 'The ZodArt a way tooo long',
    'age': 10,
    'obj': {
      'myText': 'Hello my lovely ZodArt!',
      'myInt': 100,
    },
  };

  /// simple
  final x = MySchema.z.zObject;
  final res = x.parse(valueForParsing);
  print('Result:');
  print(res.match((error) => error.localizedSummary, (val) => val));

  print('Error summary');
  print(res.getSummaryFor(MySchema.z.props.name.name));

  print('Keys:');
  print(MySchema.z.shape.keys);

  print('KeySelector:');
  print(MySchema.z.props.age);

  // with custom mapper
  // final y = MySchema.ZOld.withMapper((val) => MyClass(val.name, age: val.age));
  // final res2 = y.parse(valueForParsing);
  // print(res2.match((error) => error.localizedSummary, (val) => val));

  //shaping
  final z = MySchema.z.shape.toMap;
  print(z);
}

// TODO(zzundalek): 💡2. Generate metadata helpers
// ```dart
// ZBase<dynamic> operator [](String key) => toMap()[key];
// ```
// TODO(zzundalek): 💡3. Create a hidden internal annotation @_ZodGenerated() for tracking generated classes

// TODO(zzundalek): THERE IS A WAY TO REUSE dartdoc comments... use it through whole codebase!!! especialy for constructors
//--- {@template freezed_annotation.freezed}
//-- Flags a class as needing to be processed by Freezed and allows passing options.
//-- {@endtemplate}
