import 'package:json_annotation/json_annotation.dart';

part 'entrepreneur.g.dart';

@JsonSerializable()
class Entrepreneur {
  final String surname;
  final String name;
  final String patronymic;
  final String birthdate;

  factory Entrepreneur.fromJson(Map<String, dynamic> json) =>
      _$EntrepreneurFromJson(json);
  Map<String, dynamic> toJson() => _$EntrepreneurToJson(this);

  Entrepreneur({
    required this.surname,
    required this.name,
    required this.patronymic,
    required this.birthdate,
  });
}
