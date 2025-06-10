// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zodart_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Person _$PersonFromJson(Map<String, dynamic> json) => _Person(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: (json['age'] as num?)?.toInt(),
      disabled: json['disabled'] as bool?,
    );

Map<String, dynamic> _$PersonToJson(_Person instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'disabled': instance.disabled,
    };
