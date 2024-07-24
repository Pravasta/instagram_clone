import 'dart:convert';
import 'dart:io';

import 'package:instagram_clone/common/endpoint/app_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:instagram_clone/exception/api_error_handler.dart';
import 'package:instagram_clone/exception/api_exception.dart';
import 'package:instagram_clone/features/auth/model/user.dart';

class ApiService {
  final AppEndpoint _appEndpoint;
  final http.Client _client;

  ApiService({
    required AppEndpoint appEndpoint,
    required http.Client client,
  })  : _appEndpoint = appEndpoint,
        _client = client;

  Future<void> registerApi(String name, String email, String password) async {
    final url = _appEndpoint.register();
    final body = {
      'name': name,
      'email': email,
      'password': password,
    };
    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      await _client.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
    } on SocketException catch (e) {
      throw 'Error Login :$e';
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<UserResponse> login(String email, String password) async {
    final url = _appEndpoint.login();
    final body = {
      'email': email,
      'password': password,
    };
    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await _client.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );

      final data = userResponseFromJson(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        throw ApiErrorHandler.handleError(
          statusCode: response.statusCode,
          error: data.message,
        );
      }
    } on SocketException catch (e) {
      throw 'Error Login :$e';
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  factory ApiService.create() {
    return ApiService(
      appEndpoint: AppEndpoint.baseUrl(),
      client: http.Client(),
    );
  }
}
