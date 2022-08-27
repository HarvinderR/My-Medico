import 'package:flutter/foundation.dart';
import 'package:my_medico/data/repo.dart';
import 'package:my_medico/model/user.dart';

class LoginViewModel with ChangeNotifier {
  final Repo repo = Repo();
  Future<User> login(String username, String password) {
    print("login login");
    return repo.login(username, password);
  }
}
