import 'package:ie_checker/core/network/api/models/generalInfo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kfh.g.dart';

@JsonSerializable()
class KFH extends GeneralInfo {
  final String? mainnls;
  final String? nls;
  final String? privilgekfh;
  final String? amountareaga;
  final String? areaga;
  final String? privilefromkfh;
  final String? priviletokfh;
  final String? taxsystems;
  final String? ern;

  factory KFH.fromJson(Map<String, dynamic> json) => _$KFHFromJson(json);
  Map<String, dynamic> toJson() => _$KFHToJson(this);

  KFH({
    super.foto,
    super.name,
    super.surname,
    super.patronymic,
    super.birthdate,
    super.passporttype,
    super.passportseria,
    super.passportnumber,
    super.passportissuerdate,
    super.passportissuer,
    super.address,
    super.privilege,
    super.privilegeseria,
    super.privilegenumber,
    super.privilefrom,
    super.privileto,
    super.phone,
    super.transportlist,

    this.mainnls,
    this.nls,
    this.privilgekfh,
    this.amountareaga,
    this.areaga,
    this.privilefromkfh,
    this.priviletokfh,
    this.taxsystems,
    this.ern,
  });
}
