import 'package:dio/dio.dart';
import 'package:ie_checker/core/network/api/models/emailResponse.dart';
import 'package:ie_checker/core/network/api/models/openData.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://ws.agroprombank.com/proxy/External.MinfinProxy/')
abstract class IeCheckerApiClient {
  factory IeCheckerApiClient(Dio dio, {String? baseUrl}) = _IeCheckerApiClient;

  // @GET('/Api/MF/Login')
  // Future<> Login();

  @GET('/Api/MF/GetERN')
  Future<String> getERN(
    @Query('surname') String surname,
    @Query('name') String name,
    @Query('patronymic') String patronymic,
    @Query('birthdate') String birthdate,
  );

  @GET('/Api/MF/GetOpenData')
  Future<OpenData> getOpenData(@Query('ern') String ern);

  @GET('/Api/MF/SendEmail')
  Future<EmailResponse> sendEmail(
    @Query('ern') String ern,
    @Query('email') String email,
  );

  // @GET('/Api/MF/GetPrivateData')
  // Future<> GetPrivateData();

  // @GET('/Api/MF/CheckSession')
  // Future<> CheckSession();
}
