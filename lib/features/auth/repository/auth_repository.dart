import 'package:instagram_clone/exception/api_exception.dart';
import 'package:instagram_clone/features/auth/model/user.dart';
import 'package:instagram_clone/service/auth_service.dart';

abstract class AuthRepository {
  Future<LoginResult> login(String email, String password);
  Future<void> register(String name, String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiService _service;

  AuthRepositoryImpl({required ApiService service}) : _service = service;

  @override
  Future<LoginResult> login(String email, String password) async {
    try {
      final call = await _service.login(email, password);
      return call.loginResult!;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw LoginFailedException(message: e.toString());
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await _service.registerApi(name, email, password);
    } catch (e) {
      throw e.toString();
    }
  }

  factory AuthRepositoryImpl.create() {
    return AuthRepositoryImpl(service: ApiService.create());
  }
}
