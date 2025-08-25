import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ie_checker/core/network/api.dart';
import 'package:ie_checker/features/entrepreneur/domain/repositories/entrepreneur_repository.dart';

class EmailState {
  final bool isSending;
  final bool success;
  final String? errorMessage;

  EmailState({this.isSending = false, this.success = false, this.errorMessage});
}

class EmailCubit extends Cubit<EmailState> {
  final EntrepreneurRepository repository;

  EmailCubit(this.repository) : super(EmailState());

  Future<void> sendEmail({required String ern, required String email}) async {
    emit(EmailState(isSending: true));
    try {
      final emailResponse = await repository.sendEmail(ern: ern, email: email);
      emit(EmailState(success: true));
    } catch (e) {
      emit(EmailState(errorMessage: e.toString()));
    }
  }

  void reset() => emit(EmailState());
}
