import 'package:flutter/material.dart';

class AppColors {
  Color appColor = const Color.fromRGBO(39, 131, 255, 1);
  Color errorColor = const Color.fromRGBO(255, 74, 74, 1);
  Color appColorShade = const Color.fromRGBO(217, 240, 255, 1);
  Color primaryDark = const Color.fromRGBO(46, 46, 46, 1);
  Color black = Colors.black;
  Color white = const Color.fromRGBO(255, 255, 255, 1);
  Color background = const Color.fromRGBO(249, 250, 251, 1);
  Color transparent = const Color.fromRGBO(249, 250, 251, 0);
  Color lightGrey = const Color.fromRGBO(248, 248, 248, 1);
  Color grey = const Color.fromRGBO(202, 202, 202, 1);
  Color gradient1 = const Color.fromRGBO(60, 54, 255, 1);
  Color gradient2 = const Color.fromRGBO(28, 170, 255, 1);
  Shader linearGradientShader = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(60, 54, 255, 1),
      Color.fromRGBO(28, 170, 255, 1)
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  LinearGradient linearGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(40, 129, 255, 1),
      Color.fromRGBO(29, 169, 255, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.center,
  );
}
