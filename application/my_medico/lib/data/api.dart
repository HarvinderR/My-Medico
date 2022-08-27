import 'dart:convert';

import 'package:my_medico/model/user.dart';
import 'package:http/http.dart' as http;

abstract class IWebApi {
  Future<User> login(String username, String password);
  Future<User> register(String name, String username, String password,
      String email, String address);
  Future<bool> forgetPassword(String username);
}

class WebApi implements IWebApi {
  @override
  Future<bool> forgetPassword(String username) async {
    print("WebApi forget password with username : $username");
    var res = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/HarvinderR/My-Medico/Day-2/application/my_medico/assets/json/forgetPwd.json'));
    if (res.statusCode == 200) {
      if (jsonDecode(res.body)['response'] == 'success') {
        return true;
      }
    }
    return false;
  }

  @override
  Future<User> login(String username, String password) async {
    print("WebApi login with username : $username , password : $password");
    var res = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/HarvinderR/My-Medico/Day-2/application/my_medico/assets/json/login.json'));
    if (res.statusCode == 200) {
      String my = res.body;
      return User.fromMap(jsonDecode(my)['user']);
    }
    throw HttpAppException(res.statusCode, "Failed");
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
