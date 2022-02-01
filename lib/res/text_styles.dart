import 'package:flutter/material.dart';

import '../export.dart';

class TextStyles {
  //Montserrat font styles
  final TextStyle headingLarge = TextStyle(
    color: colors.black,
    fontWeight: FontWeight.w900,
    fontFamily: constants.fontMontserrat,
    fontSize: sizes.fontRatio * 28,
  );

  final TextStyle headingRegular = TextStyle(
    color: colors.black,
    fontWeight: FontWeight.w700,
    fontFamily: constants.fontMontserrat,
    fontSize: sizes.fontRatio * 18,
  );

  //Manrope font styles
  final TextStyle bodyLarge = TextStyle(
    color: colors.black,
    fontWeight: FontWeight.w500,
    fontFamily: constants.fontManrope,
    fontSize: sizes.fontRatio * 17,
  );

  final TextStyle bodyRegular = TextStyle(
    color: colors.black,
    fontWeight: FontWeight.w500,
    fontFamily: constants.fontManrope,
    fontSize: sizes.fontRatio * 16,
  );

  final TextStyle bodySmall = TextStyle(
    color: colors.black,
    fontWeight: FontWeight.w500,
    fontFamily: constants.fontManrope,
    fontSize: sizes.fontRatio * 14,
  );

  final TextStyle bodyExtraSmall = TextStyle(
    color: colors.black,
    fontWeight: FontWeight.w500,
    fontFamily: constants.fontManrope,
    fontSize: sizes.fontRatio * 12,
  );
}
