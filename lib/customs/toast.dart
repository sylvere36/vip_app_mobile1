
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastError(String msg){
  Fluttertoast.showToast(
    msg: msg != null ? msg : "",
    backgroundColor: Colors.red,
    textColor: Colors.white,
  );
}

void toastSuccess(String msg){
  Fluttertoast.showToast(
    msg: msg != null ? msg : "",
    backgroundColor: Colors.green,
    textColor: Colors.white,
  );
}