import 'package:json_annotation/json_annotation.dart';

part 'fullName.g.dart';

@JsonSerializable()
class FullName {
  final String? name;
  final String? surname;
  final String? patronymic;

  factory FullName.fromJson(Map<String, dynamic> json) =>
      _$FullNameFromJson(json);
  Map<String, dynamic> toJson() => _$FullNameToJson(this);

  FullName({this.name, this.surname, this.patronymic});
}
