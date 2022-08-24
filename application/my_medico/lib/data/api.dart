import 'package:my_medico/model/user.dart';

abstract class IWebApi {
  Future<User> login(String username, String password);
  Future<User> register(String name, String username, String password,
      String email, String address);
  Future<bool> forgetPassword(String username);
}

class WebApi implements IWebApi {
  @override
  Future<bool> forgetPassword(String username) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<User> login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<User> register(String name, String username, String password,
      String email, String address) {
    // TODO: implement register
    throw UnimplementedError();
  }
}

class HttpAppException implements Exception {
  final int httpcode;
  final String cause;
  const HttpAppException(this.httpcode, this.cause);
}
