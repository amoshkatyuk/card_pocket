import 'package:json_annotation/json_annotation.dart';

part 'employer.g.dart';

@JsonSerializable()
class Employer {
  final String? ernempl;
  final String? nlsempl;

  factory Employer.fromJson(Map<String, dynamic> json) =>
      _$EmployerFromJson(json);
  Map<String, dynamic> toJson() => _$EmployerToJson(this);

  Employer({this.ernempl, this.nlsempl});
}
