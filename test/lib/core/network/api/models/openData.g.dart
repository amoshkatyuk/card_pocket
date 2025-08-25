// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenData _$OpenDataFromJson(Map<String, dynamic> json) => OpenData(
  general: json['general'] == null
      ? null
      : GeneralInfo.fromJson(json['general'] as Map<String, dynamic>),
  action: (json['action'] as List<dynamic>?)
      ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
      .toList(),
  nameofactivity: (json['nameofactivity'] as List<dynamic>?)
      ?.map((e) => NameOfActivity.fromJson(e as Map<String, dynamic>))
      .toList(),
  addresses: (json['addresses'] as List<dynamic>?)
      ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
      .toList(),
  kfh: (json['kfh'] as List<dynamic>?)
      ?.map((e) => KFH.fromJson(e as Map<String, dynamic>))
      .toList(),
  empl: (json['empl'] as List<dynamic>?)
      ?.map((e) => Employee.fromJson(e as Map<String, dynamic>))
      .toList(),
  employer: (json['employer'] as List<dynamic>?)
      ?.map((e) => Employer.fromJson(e as Map<String, dynamic>))
      .toList(),
  Error: json['Error'],
);

Map<String, dynamic> _$OpenDataToJson(OpenData instance) => <String, dynamic>{
  'general': instance.general,
  'action': instance.action,
  'nameofactivity': instance.nameofactivity,
  'addresses': instance.addresses,
  'kfh': instance.kfh,
  'empl': instance.empl,
  'employer': instance.employer,
  'Error': instance.Error,
};
