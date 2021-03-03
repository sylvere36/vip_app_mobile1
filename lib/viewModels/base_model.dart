import 'package:vip1/locator.dart';
import 'package:vip1/providers/authProvider.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  final Auth _authenticationService = locator<Auth>();

  // LoginResponse get currentUser => _authenticationService.loginResponse;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}