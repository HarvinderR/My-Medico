import 'package:flutter/foundation.dart';

class LoadingViewModel with ChangeNotifier {
  bool _isShow = false;

  bool get isShow => _isShow;

  void changeState(bool isShow) {
    if (_isShow != isShow) {
      _isShow = isShow;
      notifyListeners();
    }
  }
}
