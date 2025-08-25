import 'package:json_annotation/json_annotation.dart';

part 'emailResponse.g.dart';

@JsonSerializable()
class EmailResponse {
  final String ern;
  final String email;

  factory EmailResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EmailResponseToJson(this);

  EmailResponse({required this.ern, required this.email});
}
