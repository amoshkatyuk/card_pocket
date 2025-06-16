import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:card_pocket/repositories/card_pocket/models/card_model.dart';
import 'package:card_pocket/repositories/card_pocket/abstract_card_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:card_scanner/card_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

part 'add_card_event.dart';
part 'add_card_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  AddCardBloc(this._cardRepository) : super(AddCardInitial()) {
    on<ScanCardRequested>(_onScanCardRequested);
    on<SaveCardRequested>(_onSaveCardRequested);
  }

  final AbstractCardRepository _cardRepository;

  Future<void> _onScanCardRequested(
      ScanCardRequested event,
      Emitter<AddCardState> emit,
      ) async {
    try {
      emit(AddCardScanning());

      final cameraStatus = await Permission.camera.status;
      if (!cameraStatus.isGranted) {
        final result = await Permission.camera.request();
        if (!result.isGranted) {
          emit(const AddCardFailure(exception: 'Нет разрешения на использование камеры'));
          return;
        }
      }

      final result = await CardScanner.scanCard(
        scanOptions: const CardScanOptions(
          scanCardHolderName: true,
          scanExpiryDate: true,
          validCardsToScanBeforeFinishingScan: 1,
        ),
      );

      if (result == null || result.cardNumber == null) {
        emit(const AddCardFailure(exception: 'Сканирование отменено или не удалось'));
        return;
      }

      emit(AddCardScanned(
        cardHolder: result.cardHolderName,
        cardNumber: result.cardNumber!,
        expiryDate: result.expiryDate,
      ));
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      emit(AddCardFailure(exception: e));
    }
  }

  Future<void> _onSaveCardRequested(
      SaveCardRequested event,
      Emitter<AddCardState> emit,
      ) async {
    try {
      emit(AddCardSaving());

      final card = CardModel(
        id: const Uuid().v4(),
        cardNumber: event.cardNumber,
        expiryDate: event.expiryDate,
        cardHolder: event.cardHolder,
      );

      await _cardRepository.addCard(card);

      emit(AddCardSuccess());
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      emit(AddCardFailure(exception: e));
    }
  }
}
