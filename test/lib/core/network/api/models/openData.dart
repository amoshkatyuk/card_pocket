import 'package:ie_checker/core/network/api/models/action.dart';
import 'package:ie_checker/core/network/api/models/address.dart';
import 'package:ie_checker/core/network/api/models/employee.dart';
import 'package:ie_checker/core/network/api/models/employer.dart';
import 'package:ie_checker/core/network/api/models/generalInfo.dart';
import 'package:ie_checker/core/network/api/models/kfh.dart';
import 'package:ie_checker/core/network/api/models/nameOfActivity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'openData.g.dart';

@JsonSerializable()
class OpenData {
  final GeneralInfo? general;
  final List<Action>? action;
  final List<NameOfActivity>? nameofactivity;
  final List<Address>? addresses;
  final List<KFH>? kfh;
  final List<Employee>? empl;
  final List<Employer>? employer;
  final dynamic Error;

  factory OpenData.fromJson(Map<String, dynamic> json) =>
      _$OpenDataFromJson(json);
  Map<String, dynamic> toJson() => _$OpenDataToJson(this);

  OpenData({
    this.general,
    this.action,
    this.nameofactivity,
    this.addresses,
    this.kfh,
    this.empl,
    this.employer,
    this.Error,
  });
}
