// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrepreneur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entrepreneur _$EntrepreneurFromJson(Map<String, dynamic> json) => Entrepreneur(
  surname: json['surname'] as String,
  name: json['name'] as String,
  patronymic: json['patronymic'] as String,
  birthdate: json['birthdate'] as String,
);

Map<String, dynamic> _$EntrepreneurToJson(Entrepreneur instance) =>
    <String, dynamic>{
      'surname': instance.surname,
      'name': instance.name,
      'patronymic': instance.patronymic,
      'birthdate': instance.birthdate,
    };
