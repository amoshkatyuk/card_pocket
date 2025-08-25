// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
  foto: json['foto'] as String?,
  name: json['name'] as String?,
  surname: json['surname'] as String?,
  patronymic: json['patronymic'] as String?,
  birthdate: json['birthdate'] as String?,
  passporttype: json['passporttype'] as String?,
  passportseria: json['passportseria'] as String?,
  passportnumber: json['passportnumber'] as String?,
  passportissuerdate: json['passportissuerdate'] as String?,
  passportissuer: json['passportissuer'] as String?,
  address: json['address'] as String?,
  privilege: json['privilege'] as String?,
  privilegeseria: json['privilegeseria'] as String?,
  privilegenumber: json['privilegenumber'] as String?,
  privilefrom: json['privilefrom'] as String?,
  privileto: json['privileto'] as String?,
  phone: json['phone'] as String?,
  transportlist: json['transportlist'] as String?,
  conctractnumber: json['conctractnumber'] as String?,
  contractfrom: json['contractfrom'] as String?,
  contractto: json['contractto'] as String?,
  salary: json['salary'] as String?,
  taxsystems: json['taxsystems'] as String?,
  ern: json['ern'] as String?,
  mainern: json['mainern'] as String?,
  nlsempl: json['nlsempl'] as String?,
);

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
  'foto': instance.foto,
  'name': instance.name,
  'surname': instance.surname,
  'patronymic': instance.patronymic,
  'birthdate': instance.birthdate,
  'passporttype': instance.passporttype,
  'passportseria': instance.passportseria,
  'passportnumber': instance.passportnumber,
  'passportissuerdate': instance.passportissuerdate,
  'passportissuer': instance.passportissuer,
  'address': instance.address,
  'privilege': instance.privilege,
  'privilegeseria': instance.privilegeseria,
  'privilegenumber': instance.privilegenumber,
  'privilefrom': instance.privilefrom,
  'privileto': instance.privileto,
  'phone': instance.phone,
  'transportlist': instance.transportlist,
  'conctractnumber': instance.conctractnumber,
  'contractfrom': instance.contractfrom,
  'contractto': instance.contractto,
  'salary': instance.salary,
  'taxsystems': instance.taxsystems,
  'ern': instance.ern,
  'mainern': instance.mainern,
  'nlsempl': instance.nlsempl,
};
