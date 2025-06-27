// import 'package:analyzer/dart/ast/ast.dart';

// Just test
// ignore_for_file: avoid_print

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:zodart/zodart.dart';

ZObject<T> withMapper<T>(T Function(({String name, int age})) mapper) {
  return ZObject.withMapper(
    {}, // shape.toMap(),
    fromJson: (val) {
      final parsedRecord = (name: val['name'], age: val['age']) as ({String name, int age});
      return mapper(parsedRecord);
    },
  );
}

// ZObject<T> withMapper<T>(T Function(_$ZMySchemaRes parsedRecord) mapper) {
//   return ZObject.withMapper(
//     shape.toMap(),
//     fromJson: (parsedVal) {
//       final parsedRecord = (name: parsedVal['name'], age: parsedVal['age']) as _$ZMySchemaRes;
//       return mapper(parsedRecord);
//     },
//   );
// }

void main() {
  final names = ['name', 'age'];
  const theType = '({String name, int age})';

  final parsedRecord = names.map((name) => "$name: val['$name']");
  final body =
      '''
        return ZObject.withMapper(
          shape.toMap(),
          fromJson: (val) {
            final parsedRecord = (${parsedRecord.join(',')}) as $theType;
            return mapper(parsedRecord);
          },
        );        
      ''';

  final m = Method(
    (m) => m
      ..returns = refer('ZObject<T>')
      ..name = 'withMapper'
      ..requiredParameters.add(
        Parameter(
          (p) => p
            ..name = 'mapper'
            ..type = refer('T Function($theType val)'),
        ),
      )
      ..body = Code(body),
  );

  final res = Class(
    (c) => c
      ..name = 'X'
      ..methods.add(m),
  );

  final emitter = DartEmitter();
  print(
    DartFormatter(languageVersion: DartFormatter.latestLanguageVersion).format('${res.accept(emitter)}'),
  );
}
// void main() {
//   final res = Class(
//     (c) => c
//       ..name = 'MyName'
//       ..constructors.add(
//         Constructor((c) => c..constant = true),
//       )
//       ..methods.addAll([
//         Method(
//           (m) => m
//             ..name = 'age'
//             ..returns = refer('MySchemaPropsEnum')
//             ..type = MethodType.getter
//             ..body = const Code('MySchemaPropsEnum()')
//             ..lambda = true,
//         ),
//       ]),
//   );

//   final emitter = DartEmitter();
//   print(
//     DartFormatter(languageVersion: DartFormatter.latestLanguageVersion).format('${res.accept(emitter)}'),
//   );
// }
//   final res = Class(
//     (c) => c
//       ..name = 'MyName'
//       ..constructors.add(
//         Constructor((c) => c..constant = true),
//       )
//       ..methods.addAll([
//         Method(
//           (m) => m
//             ..name = 'age'
//             ..returns = refer('MySchemaPropsEnum')
//             ..type = MethodType.getter
//             ..body = const Code('MySchemaPropsEnum.age')
//             ..lambda = true,
//         ),
//       ]),
//   );

//   final emitter = DartEmitter();
//   print(
//     DartFormatter(languageVersion: DartFormatter.latestLanguageVersion).format('${res.accept(emitter)}'),
//   );
// }

// class _$MySchemaProps {
//   const _$MySchemaProps();

//   MySchemaPropsEnum get age => MySchemaPropsEnum.age;
//   MySchemaPropsEnum get name => MySchemaPropsEnum.name;
// }

// void main() {
//   final res = Enum(
//     (e) => e
//       ..name = 'MyEnum'
//       ..values.add(
//         EnumValue(
//           (e) => e
//             ..name = 'age'
//             ..arguments.add(literalString('age')),
//         ),
//       )
//       ..fields.add(
//         Field(
//           (f) => f
//             ..name = 'val'
//             ..type = refer('String')
//             ..modifier = FieldModifier.final$,
//         ),
//       )
//       ..constructors.add(
//         Constructor(
//           (c) => c
//             ..constant = true
//             ..name = null
//             ..requiredParameters.add(
//               Parameter(
//                 (p) => p
//                   ..named = false
//                   ..toThis = true
//                   ..name = 'val',
//               ),
//             ),
//         ),
//       ),
//   );

//   final emitter = DartEmitter();
//   print(
//     DartFormatter(languageVersion: DartFormatter.latestLanguageVersion).format('${res.accept(emitter)}'),
//   );
// }
// void main() {
//   final record = RecordType(
//     (r) => r
//       ..positionalFieldTypes.addAll([
//         refer('int'),
//         refer('String'),
//       ])
//       ..namedFieldTypes.addEntries(
//         [
//           MapEntry('name', refer('String')),
//         ],
//       ),
//   );

//   final res = TypeDef(
//     (t) => t
//       ..name = 'MyType'
//       ..definition = record,
//   );

//   final emitter = DartEmitter();
//   print(
//     DartFormatter(languageVersion: DartFormatter.latestLanguageVersion).format('${res.accept(emitter)}'),
//   );
// }
