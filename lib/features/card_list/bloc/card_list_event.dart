part of 'card_list_bloc.dart';

abstract class CardListEvent extends Equatable {
  const CardListEvent();

  @override
  List<Object?> get props => [];
}

class LoadCardList extends CardListEvent {
  const LoadCardList();
}

class DeleteCard extends CardListEvent {
  const DeleteCard(this.cardId);

  final String cardId;

  @override
  List<Object?> get props => [cardId];
}