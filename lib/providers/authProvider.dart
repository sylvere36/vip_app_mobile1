import 'dart:async';
import 'dart:convert';
import 'package:vip1/utils/UIData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:prefs/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Auth with ChangeNotifier {
  // final FacebookLogin facebookSignIn = new FacebookLogin();
  bool absorbPoint = false;

  final storage = new FlutterSecureStorage();
  // LoginResponse loginResponse;

  String deliveryFeesStore = "DeliveryFeesStore";

  Auth() {
    print("Auth Provider");
  }

  changeAbsorbPoint(bool absorb) {
    this.absorbPoint = absorb;
    notifyListeners();
  }

  Future<bool> isUserLoggedIn() async {
    var data = await storage.read(key: ExtraString.StorageDatakey);
    if (data != null && data.isNotEmpty) {
      // loginResponse = LoginResponse.fromJson(jsonDecode(data));
      return true;
    }
    return false;
  }



  /*Future<LoginResponse> loginUser(String email, String password) async{

  }*/


  void logout() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Prefs.clear();
    final storage = new FlutterSecureStorage();
    storage.delete(key: ExtraString.StorageDatakey);
    storage.deleteAll();
    // this.loginResponse = null;
    notifyListeners();
  }
}