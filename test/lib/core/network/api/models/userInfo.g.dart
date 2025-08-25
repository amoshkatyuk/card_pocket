// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
  SID: json['SID'] as String,
  UserName: json['UserName'] as String,
  Error: json['Error'],
);

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
  'SID': instance.SID,
  'UserName': instance.UserName,
  'Error': instance.Error,
};
