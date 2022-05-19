import 'package:flutter/material.dart';

class AppColors {
  Color accentPrimary = const Color.fromRGBO(60, 53, 255, 1);
  Color accentSecondary = const Color.fromRGBO(108, 103, 255, 1);
  Color primaryLight = const Color.fromRGBO(250, 250, 250, 1);
  Color primaryDark = const Color.fromRGBO(10, 10, 14, 1);
  Color white = Colors.white;
  Color black = const Color.fromRGBO(0, 0, 0, 1);
  Color error = const Color.fromRGBO(255, 69, 58, 1);
  Color success = const Color.fromRGBO(69, 255, 110, 1);
  Color tieYellow = const Color.fromRGBO(245, 195, 36, 1);
  Color transparent = const Color.fromRGBO(249, 250, 251, 0);
  Color otherYellow = const Color.fromRGBO(255, 204, 51, 1);

  LinearGradient linearGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(40, 129, 255, 1),
      Color.fromRGBO(29, 169, 255, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.center,
  );
}
