import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String? Account;
  final String? address;
  final String? MarketName;
  final String? PlaceNumber;
  final String? PlaceType;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  Address({
    this.Account,
    this.address,
    this.MarketName,
    this.PlaceNumber,
    this.PlaceType,
  });
}
