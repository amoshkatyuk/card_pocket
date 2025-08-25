import 'package:json_annotation/json_annotation.dart';

part 'nameOfActivity.g.dart';

@JsonSerializable()
class NameOfActivity {
  final String? Account;
  final String? NameOfActivities;
  final String? CountUnit;

  factory NameOfActivity.fromJson(Map<String, dynamic> json) =>
      _$NameOfActivityFromJson(json);
  Map<String, dynamic> toJson() => _$NameOfActivityToJson(this);

  NameOfActivity({this.Account, this.NameOfActivities, this.CountUnit});
}
