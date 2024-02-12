import 'dart:convert';
import 'dart:html';

import 'package:flutter_application_login/model/dto/login_dto.dart';
import 'package:flutter_application_login/model/response/login_response.dart';
import 'package:flutter_application_login/model/response/request_token_response.dart';
import 'package:flutter_application_login/repositories/auth_repository.dart';
import 'package:http/http.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Client _httpClient = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    final response = await _httpClient.post(
      Uri.parse(
          'https://api.themoviedb.org/3/authentication/token/validate_with_login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYjI0MGQ1MDgwMTk3NmM2Zjc1OTI2MDY5NTgxYjBlMyIsInN1YiI6IjY1NDBjNTkyMzU4MThmMDExZGE5NDZlNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.veoQuABqLBWRPoq0kxJ_MqPl40gemDQBLA3eoQeJirU'
      },
      body: loginDto.toJson(),
    );
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Future<RequestTokenResponse> getRequestToken() async {
    final response = await _httpClient.get(
      Uri.parse('https://api.themoviedb.org/3/authentication/token/new'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MzNkMmM0ODY1NzJhZmIyNDJjNmZlN2MxZGRjNjc3MSIsInN1YiI6IjVjYzZjYTBhMGUwYTI2NGVlZmVkYmQwZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Lr-_SOXieFdDd-0CNEqipNgfEviSHDP0uX1sm_H8bUI'
      },
    );
    if (response.statusCode == 200) {
      return RequestTokenResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to do get request token');
    }
  }
}
