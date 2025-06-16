import 'package:hive/hive.dart';

part 'card_model.g.dart';

@HiveType(typeId: 0)
class CardModel extends HiveObject {
  CardModel({
    required this.id,
    required this.cardHolder,
    required this.cardNumber,
    required this.expiryDate,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String cardHolder;

  @HiveField(2)
  final String cardNumber;

  @HiveField(3)
  final String expiryDate;
}