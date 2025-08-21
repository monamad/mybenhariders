import 'package:dio/dio.dart';
import 'package:mybenhariders/core/networking/api_constants.dart';
import 'package:mybenhariders/features/auth/phone_login/data/models/login_request_body.dart';
import 'package:mybenhariders/features/auth/phone_login/data/models/login_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST('auth/login')
  Future<LoginResponse> login(@Body() LoginRequestBody body);

  @POST('auth/signin/google')
  Future<LoginResponse> googleSignIn(@Body() Map<String, dynamic> body);
}
