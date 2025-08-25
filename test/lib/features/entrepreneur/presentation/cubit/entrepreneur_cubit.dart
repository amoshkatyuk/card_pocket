import 'package:bloc/bloc.dart';
import '../../../../core/network/api/models/entrepreneur.dart';
import '../../domain/repositories/entrepreneur_repository.dart';

class EntrepreneurState {
  final bool isLoading;
  final Entrepreneur? entrepreneur;
  final Map<String, dynamic>? openData;
  final String? errorMessage;
  final String? ern;

  EntrepreneurState({
    this.isLoading = false,
    this.entrepreneur,
    this.openData,
    this.errorMessage,
    this.ern,
  });

  EntrepreneurState copyWith({
    bool? isLoading,
    Entrepreneur? entrepreneur,
    Map<String, dynamic>? openData,
    String? errorMessage,
    String? ern,
  }) {
    return EntrepreneurState(
      isLoading: isLoading ?? this.isLoading,
      entrepreneur: entrepreneur ?? this.entrepreneur,
      openData: openData ?? this.openData,
      errorMessage: errorMessage ?? this.errorMessage,
      ern: ern ?? this.ern,
    );
  }
}

class EntrepreneurCubit extends Cubit<EntrepreneurState> {
  final EntrepreneurRepository repository;

  EntrepreneurCubit(this.repository) : super(EntrepreneurState());

  Future<void> fetchEntrepreneur({
    required String surname,
    required String name,
    required String patronymic,
    required String birthdate,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final ernJson = await repository.getERN(
        surname: surname,
        name: name,
        patronymic: patronymic,
        birthdate: birthdate,
      );

      final ern = ernJson['ERN'] as String;

      final openData = await repository.getOpenData(ern: ern);

      emit(
        state.copyWith(
          isLoading: false,
          entrepreneur: Entrepreneur(
            surname: surname,
            name: name,
            patronymic: patronymic,
            birthdate: birthdate,
          ),
          openData: openData,
          ern: ern,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void reset() {
    emit(EntrepreneurState());
  }
}
