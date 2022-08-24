import 'package:shared_preferences/shared_preferences.dart';

abstract class IDb {
  Future<String?> getString(String prop);
  Future<bool?> getbool(String prop);
  Future<int?> getInt(String prop);
  Future<double?> getDouble(String prop);
}

class Db implements IDb {
  @override
  Future<double?> getDouble(String prop) async {
    return (await SharedPreferences.getInstance()).getDouble(prop);
  }

  @override
  Future<int?> getInt(String prop) async {
    return (await SharedPreferences.getInstance()).getInt(prop);
  }

  @override
  Future<String?> getString(String prop) async {
    return (await SharedPreferences.getInstance()).getString(prop);
  }

  @override
  Future<bool?> getbool(String prop) async {
    return (await SharedPreferences.getInstance()).getBool(prop);
  }
}
