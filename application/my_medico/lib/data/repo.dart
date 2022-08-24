// ignore_for_file: unnecessary_this

import 'package:my_medico/data/api.dart';
import 'package:my_medico/data/db.dart';
import 'package:my_medico/model/user.dart';

class Repo {
  final _RepoHelper _helper = _RepoHelper(WebApi(), Db());
  static final Repo _singleton = Repo._internal();

  Future<void> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 5));
  }

  factory Repo() {
    return _singleton;
  }

  Repo._internal();
}

class Response<T, E> {
  final T? data;
  final E? exception;
  Response({this.data, this.exception}) {
    assert(this.data == null || this.exception == null,
        "Both data and exception are null");
  }

  bool isException() {
    return exception == null;
  }
}

class _RepoHelper implements IWebApi, IDb {
  final WebApi _webApi;
  final Db _db;

  _RepoHelper(this._webApi, this._db);

  @override
  Future<bool> forgetPassword(String username) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<double?> getDouble(String prop) {
    // TODO: implement getDouble
    throw UnimplementedError();
  }

  @override
  Future<int?> getInt(String prop) {
    // TODO: implement getInt
    throw UnimplementedError();
  }

  @override
  Future<String?> getString(String prop) {
    // TODO: implement getString
    throw UnimplementedError();
  }

  @override
  Future<bool?> getbool(String prop) {
    // TODO: implement getbool
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
