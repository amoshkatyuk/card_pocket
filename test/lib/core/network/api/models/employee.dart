import 'package:ie_checker/core/network/api/models/generalInfo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee extends GeneralInfo {
  final String? conctractnumber;
  final String? contractfrom;
  final String? contractto;
  final String? salary;
  final String? taxsystems;
  final String? ern;
  final String? mainern;
  final String? nlsempl;

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  Employee({
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

    this.conctractnumber,
    this.contractfrom,
    this.contractto,
    this.salary,
    this.taxsystems,
    this.ern,
    this.mainern,
    this.nlsempl,
  });
}
