import 'package:ie_checker/core/network/api/models/emailResponse.dart';

import '../../../../core/network/api/models/entrepreneur.dart';

abstract class EntrepreneurRepository {
  Future<Map<String, dynamic>> getERN({
    required String surname,
    required String name,
    required String patronymic,
    required String birthdate,
  });

  Future<Map<String, dynamic>> getOpenData({required String ern});

  Future<EmailResponse> sendEmail({required String ern, required String email});
}
