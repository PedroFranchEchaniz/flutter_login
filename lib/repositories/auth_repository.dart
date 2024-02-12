import 'package:flutter_application_login/model/dto/login_dto.dart';
import 'package:flutter_application_login/model/response/login_response.dart';
import 'package:flutter_application_login/model/response/request_token_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginDto loginDto);
  Future<RequestTokenResponse> getRequestToken();
}
