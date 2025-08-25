// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
  Account: json['Account'] as String?,
  address: json['address'] as String?,
  MarketName: json['MarketName'] as String?,
  PlaceNumber: json['PlaceNumber'] as String?,
  PlaceType: json['PlaceType'] as String?,
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'Account': instance.Account,
  'address': instance.address,
  'MarketName': instance.MarketName,
  'PlaceNumber': instance.PlaceNumber,
  'PlaceType': instance.PlaceType,
};
