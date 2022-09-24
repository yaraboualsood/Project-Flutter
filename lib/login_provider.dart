import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'login_model.dart';

class LoginProvider with ChangeNotifier {
  LoginModel? loginModel;
  Map<String, dynamic>? data;
  Future<dynamic> login({
    String? email,
    String? password,
  }) async {
    var dio = Dio();
    dio.options.headers = {"lang": "en", "Content-Type": "application/json"};

    data = {"email": email, "password": password};
    notifyListeners();

    final response =
        await dio.post("https://student.valuxapps.com/api/login", data: data);
    print("data login " + response.data.toString());
    loginModel = LoginModel.fromJson(response.data);
  }
}
