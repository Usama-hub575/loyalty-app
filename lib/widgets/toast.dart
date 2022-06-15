import 'package:fluttertoast/fluttertoast.dart';
import '../export.dart';
import 'package:flutter/material.dart';

void showToast({@required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: colors.error,
    textColor: colors.white,
    fontSize: 16.0,
  );
}
