import 'package:flutter/foundation.dart';
import 'package:my_medico/data/repo.dart';

class ForgetPasswordViewModel with ChangeNotifier {
  final Repo repo = Repo();
  bool _emailSend = false;
  bool get emailSend => _emailSend;

  Future<bool> sendEmail(String username) {
    return repo.forgetPassword(username);
  }
}
