import 'dart:convert';

import 'package:ie_checker/core/network/api.dart';
import 'package:ie_checker/core/network/api/models/entrepreneur.dart';
import 'package:ie_checker/features/entrepreneur/domain/repositories/entrepreneur_repository.dart';

import '../../../../core/network/api/models/emailResponse.dart';

class EntrepreneurRepositoryImpl implements EntrepreneurRepository {
  final IeCheckerApiClient api;

  EntrepreneurRepositoryImpl(this.api);

  @override
  Future<Map<String, dynamic>> getERN({
    required String surname,
    required String name,
    required String patronymic,
    required String birthdate,
  }) async {
    final ernJson = await api.getERN(surname, name, patronymic, birthdate);
    return jsonDecode(ernJson) as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getOpenData({required String ern}) async {
    final openData = await api.getOpenData(ern);
    return openData.toJson();
  }

  @override
  Future<EmailResponse> sendEmail({
    required String ern,
    required String email,
  }) async {
    final emailResponse = await api.sendEmail(ern, email);
    return emailResponse;
  }
}
