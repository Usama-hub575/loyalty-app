import 'package:aactivpay/export.dart';
import 'package:flutter/cupertino.dart';

Widget shader({double top, double bottom, double left, double right}) {
  return Positioned(
    top: top,
    bottom: bottom,
    left: left,
    right: right,
    child: Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: colors.appColorShade,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: colors.appColorShade,
            spreadRadius: 35,
            blurRadius: 30,
          ),
        ],
      ),
    ),
  );
}
