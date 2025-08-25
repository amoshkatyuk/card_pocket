import 'package:json_annotation/json_annotation.dart';

part 'action.g.dart';

@JsonSerializable()
class Action {
  final String? Account;
  final String? AviableContragents;
  final String? AviablePayments;
  final String? PayState;
  final String? TaxationSystem;
  final String? ERN;
  final String? ERNEm;
  final String? Amount;
  final String? LastPayedAmount;
  final String? LastPayedDate;
  final String? NLSEmpl;

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
  Map<String, dynamic> toJson() => _$ActionToJson(this);

  Action({
    this.Account,
    this.AviableContragents,
    this.AviablePayments,
    this.PayState,
    this.TaxationSystem,
    this.ERN,
    this.ERNEm,
    this.Amount,
    this.LastPayedAmount,
    this.LastPayedDate,
    this.NLSEmpl,
  });
}
