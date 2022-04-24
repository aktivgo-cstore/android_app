import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/api_login_user.dart';
import '../model/api_registration_user.dart';
import '../request/login_body.dart';
import '../request/logout_body.dart';
import '../request/registration_body.dart';

class UserService {
  static const _BASE_URL = 'https://e3a6-92-255-218-125.eu.ngrok.io';

  Future<ApiRegistrationUser> register(
    RegistrationBody registrationBody,
  ) async {
    var url = Uri.parse(_BASE_URL + '/registration');
    final response = await http.post(
      url,
      body: json.encode(registrationBody.toApi()),
      headers: {'Content-Type': 'application/json'},
    );
    return ApiRegistrationUser.fromApi(
      json.decode(utf8.decode(response.bodyBytes)),
    );
  }

  Future<ApiLoginUser> login(LoginBody loginBody) async {
    var url = Uri.parse(_BASE_URL + '/login');
    final response = await http.post(
      url,
      body: json.encode(loginBody.toApi()),
      headers: {'Content-Type': 'application/json'},
    );
    return ApiLoginUser.fromApi(json.decode(utf8.decode(response.bodyBytes)));
  }

  Future<void> logout(LogoutBody logoutBody) async {
    var url = Uri.parse(_BASE_URL + '/logout');
    await http.post(
      url,
      body: json.encode(logoutBody.toApi()),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
