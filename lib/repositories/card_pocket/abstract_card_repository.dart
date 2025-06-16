import 'package:card_pocket/repositories/card_pocket/models/card_model.dart';

abstract class AbstractCardRepository {
  Future<List<CardModel>> getCards();
  Future<void> addCard(CardModel card);
  Future<void> deleteCard(String id);
}