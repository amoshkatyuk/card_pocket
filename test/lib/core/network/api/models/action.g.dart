// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) => Action(
  Account: json['Account'] as String?,
  AviableContragents: json['AviableContragents'] as String?,
  AviablePayments: json['AviablePayments'] as String?,
  PayState: json['PayState'] as String?,
  TaxationSystem: json['TaxationSystem'] as String?,
  ERN: json['ERN'] as String?,
  ERNEm: json['ERNEm'] as String?,
  Amount: json['Amount'] as String?,
  LastPayedAmount: json['LastPayedAmount'] as String?,
  LastPayedDate: json['LastPayedDate'] as String?,
  NLSEmpl: json['NLSEmpl'] as String?,
);

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
  'Account': instance.Account,
  'AviableContragents': instance.AviableContragents,
  'AviablePayments': instance.AviablePayments,
  'PayState': instance.PayState,
  'TaxationSystem': instance.TaxationSystem,
  'ERN': instance.ERN,
  'ERNEm': instance.ERNEm,
  'Amount': instance.Amount,
  'LastPayedAmount': instance.LastPayedAmount,
  'LastPayedDate': instance.LastPayedDate,
  'NLSEmpl': instance.NLSEmpl,
};
