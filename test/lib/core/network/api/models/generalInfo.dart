import 'package:json_annotation/json_annotation.dart';

part 'generalInfo.g.dart';

@JsonSerializable()
class GeneralInfo {
  final String? foto;
  final String? name;
  final String? surname;
  final String? patronymic;
  final String? birthdate;
  final String? passporttype;
  final String? passportseria;
  final String? passportnumber;
  final String? passportissuerdate;
  final String? passportissuer;
  final String? address;
  final String? privilege;
  final String? privilegeseria;
  final String? privilegenumber;
  final String? privilefrom;
  final String? privileto;
  final String? phone;
  final String? transportlist;

  factory GeneralInfo.fromJson(Map<String, dynamic> json) =>
      _$GeneralInfoFromJson(json);
  Map<String, dynamic> toJson() => _$GeneralInfoToJson(this);

  GeneralInfo({
    this.foto,
    this.name,
    this.surname,
    this.patronymic,
    this.birthdate,
    this.passporttype,
    this.passportseria,
    this.passportnumber,
    this.passportissuerdate,
    this.passportissuer,
    this.address,
    this.privilege,
    this.privilegeseria,
    this.privilegenumber,
    this.privilefrom,
    this.privileto,
    this.phone,
    this.transportlist,
  });
}
