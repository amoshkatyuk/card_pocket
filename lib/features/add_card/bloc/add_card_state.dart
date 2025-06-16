part of 'add_card_bloc.dart';


abstract class AddCardState extends Equatable {
  const AddCardState();

  @override
  List<Object?> get props => [];
}

class AddCardInitial extends AddCardState {}

class AddCardScanning extends AddCardState {}

class AddCardScanned extends AddCardState {
  AddCardScanned({
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

class AddCardSaving extends AddCardState {}

class AddCardSuccess extends AddCardState {}

class AddCardFailure extends AddCardState {
  const AddCardFailure({
    required this.exception
  });

  final Object exception;

  @override
  List<Object?> get props => [exception];
}