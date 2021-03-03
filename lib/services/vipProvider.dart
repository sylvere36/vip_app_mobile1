import 'dart:convert';
import 'dart:io';

import 'package:vip1/customs/toast.dart';
import 'package:vip1/models/vipModel.dart';
import 'package:vip1/utils/UIData.dart';
import 'package:http/http.dart' as http;

class VipProvider {
  final String _endpoint = Url.apiUrl + "correctScoreFirst/";

  Future<VipModel> all() async {
    try {
      final http.Response response = await http.get(
        _endpoint,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.body != null) {
          return VipModel.fromJson(
              json.decode(utf8.decode(response.bodyBytes)));
        } else {
          return new VipModel();
        }
      } else {
        toastError(response.body);
        return null;
      }
    } on SocketException {
      toastError('Pas de connexion internet 😑');
      return null;
    } on FormatException {
      toastError('Mauvais format de reponse 👎');
      return null;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      toastError("$error");
      return null;
    }
  }
}
