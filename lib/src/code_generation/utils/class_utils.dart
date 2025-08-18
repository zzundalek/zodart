import 'package:code_builder/code_builder.dart';

/// Utils class used to build common method overrides.
///
/// Provides overrides for:
/// - `.toString()`
/// - `operator ==`
/// - `get hashCode`
class ClassBuilderUtils {
  /// Create a new [ClassBuilderUtils].
  const ClassBuilderUtils();

  /// Returns true if the output type is a collection.
  ///
  /// Only supported collection in ZodArt is `ZArray` / `ZNullableArray`.
  ///
  /// Note: For equality / hashes on a collection DeepCollectionEquality must be used.
  bool _isCollection(String zType) => RegExp(r'^Z(Nullable)?Array.*$').hasMatch(zType);

  /// Returns a toString method override for the [className].
  Method buildToStringMethod(String className, Set<String> propertyNames) {
    final propertiesStr = propertyNames.map((fieldName) => '$fieldName: \$$fieldName').join(', ');

    return Method(
      (m) => m
        ..name = 'toString'
        ..annotations.add(refer('override'))
        ..returns = refer('String')
        ..body = Code("return '$className($propertiesStr)';"),
    );
  }

  /// Returns the equality method override for the [className] and its [zSchema].
  Method buildEqualityMethod(String className, Map<String, String> zSchema) {
    final propertiesEquality = zSchema.entries
        .map((entry) {
          final propertyName = entry.key;
          final zType = entry.value;

          return _isCollection(zType)
              ? '(identical($propertyName, other.$propertyName) '
                    '|| const DeepCollectionEquality().equals($propertyName, other.$propertyName))'
              : '(identical($propertyName, other.$propertyName) || $propertyName == other.$propertyName)';
        })
        .join(' && ');

    return Method(
      (m) => m
        ..name = 'operator =='
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'other'
              ..named = false
              ..type = refer('Object'),
          ),
        )
        ..annotations.add(refer('override'))
        ..returns = refer('bool')
        ..body = Code(
          'return identical(this, other) '
          '|| (runtimeType == other.runtimeType && other is $className && $propertiesEquality);',
        ),
    );
  }

  /// Returns the `hashCode` method override for [zSchema].
  Method buildHashCodeMethod(Map<String, String> zSchema) {
    final propertyHashes = zSchema.entries.map((entry) {
      final propertyName = entry.key;
      final zType = entry.value;
      return _isCollection(zType) ? 'const DeepCollectionEquality().hash($propertyName)' : propertyName;
    });

    final hashBody = ['runtimeType', ...propertyHashes].join(', ');

    return Method(
      (m) => m
        ..name = 'hashCode'
        ..annotations.add(refer('override'))
        ..type = MethodType.getter
        ..lambda = true
        ..returns = refer('int')
        ..body = Code('Object.hash($hashBody)'),
    );
  }
}
