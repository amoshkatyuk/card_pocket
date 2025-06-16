import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:card_pocket/repositories/card_pocket/models/card_model.dart';
import 'abstract_card_repository.dart';

class CardRepository implements AbstractCardRepository {
  static const String _boxName = 'cardsBox';

  Future<Box<CardModel>> _getBox() async {
    return await Hive.openBox<CardModel>(_boxName);
  }

  @override
  Future<List<CardModel>> getCards() async {
    final box = await _getBox();
    return box.values.toList();
  }

  @override
  Future<void> addCard(CardModel card) async {
    final box = await _getBox();
    await box.put(card.id, card);
  }

  @override
  Future<void> deleteCard(String id) async {
    final box = await _getBox();
    await box.delete(id);
  }
}