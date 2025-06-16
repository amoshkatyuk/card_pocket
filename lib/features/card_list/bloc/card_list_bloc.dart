import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:card_pocket/repositories/card_pocket/models/models.dart';
import 'package:card_pocket/repositories/card_pocket/abstract_card_repository.dart';

part 'card_list_event.dart';
part 'card_list_state.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  CardListBloc(this._repository) : super(CardListInitial()) {
    on<LoadCardList>(_onLoadCardList);
    on<DeleteCard>(_onDeleteCard);
  }

  final AbstractCardRepository _repository;

  Future<void> _onLoadCardList(
      LoadCardList event, Emitter<CardListState> emit) async {
    emit(CardListLoading());
    try {
      final cards = await _repository.getCards();
      emit(CardListLoaded(cards));
    } catch(e, st) {
      GetIt.I<Talker>().handle(e, st);
      emit(CardListFailure(e));
    }
  }

  Future<void> _onDeleteCard(
      DeleteCard event, Emitter<CardListState> emit) async {
    if(state is! CardListLoaded) return;
    final currentCards = List<CardModel>.from((state as CardListLoaded).cards);
    try {
      await _repository.deleteCard(event.cardId);
      currentCards.removeWhere((card) => card.id == event.cardId);
      emit(CardListLoaded(currentCards));
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      emit(CardListFailure(e));
    }
  }
}