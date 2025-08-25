// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fullName.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullName _$FullNameFromJson(Map<String, dynamic> json) => FullName(
  name: json['name'] as String?,
  surname: json['surname'] as String?,
  patronymic: json['patronymic'] as String?,
);

Map<String, dynamic> _$FullNameToJson(FullName instance) => <String, dynamic>{
  'name': instance.name,
  'surname': instance.surname,
  'patronymic': instance.patronymic,
};
