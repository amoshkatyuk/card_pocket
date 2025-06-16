part of 'card_list_bloc.dart';

abstract class CardListState extends Equatable {
  const CardListState();

  @override
  List<Object?> get props => [];
}

class CardListInitial extends CardListState {}

class CardListLoading extends CardListState {}

class CardListLoaded extends CardListState {
  const CardListLoaded(this.cards);

  final List<CardModel> cards;

  @override
  List<Object?> get props => [cards];
}

class CardListFailure extends CardListState {
  const CardListFailure(this.exception);

  final Object exception;

  @override
  List<Object?> get props => [exception];
}