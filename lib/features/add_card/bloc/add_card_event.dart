part of 'add_card_bloc.dart';


abstract class AddCardEvent extends Equatable {
  const AddCardEvent();

  @override
  List<Object?> get props => [];
}

class ScanCardRequested extends AddCardEvent {}

class SaveCardRequested extends AddCardEvent {
  const SaveCardRequested({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolder,
});

  final String cardNumber;
  final String expiryDate;
  final String cardHolder;

  @override
  List<Object?> get props => [cardNumber, expiryDate, cardHolder];
}