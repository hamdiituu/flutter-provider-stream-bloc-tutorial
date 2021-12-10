import 'package:flutter/material.dart';

enum LoginTypes { Success, Fail, None, Loading }

class AuthProvider extends ChangeNotifier {
  LoginTypes loginStatus = LoginTypes.None;

  String get status {
    switch (loginStatus) {
      case LoginTypes.Success:
        return "Başarılı";
      case LoginTypes.Fail:
        return "Hatalı";
      case LoginTypes.None:
        return "Bilinmiyor";
      case LoginTypes.Loading:
        return "Yükleniyor";
    }
  }

  void login(bool isLogin) async {
    loginStatus = LoginTypes.Loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    isLogin ? loginStatus = LoginTypes.Success : loginStatus = LoginTypes.Fail;
    notifyListeners();
  }

  void logout() async {
    loginStatus = LoginTypes.Loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    loginStatus = LoginTypes.None;
    notifyListeners();
  }
}
