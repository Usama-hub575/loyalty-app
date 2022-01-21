import 'package:flutter/material.dart';

import '../export.dart';

class TextStyles {
  //Montserrat font styles
  final TextStyle thinMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w100,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle thinStrokeMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w100,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle thinItalicMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w100,
    fontStyle: FontStyle.italic,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle lightMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w300,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle lightItalicMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle regularMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w400,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle regularItalicMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle mediumMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w500,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle mediumItalicMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle semiBoldMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w600,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle semiBoldItalicMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle boldMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w700,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle boldGradientMontserrat = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: constants.fontMontserrat,
    foreground: Paint()..shader = colors.linearGradientShader,
  );

  final TextStyle boldItalicMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle extraBoldMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w800,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle extraBoldItalicMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.italic,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle blackMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w900,
    fontFamily: constants.fontMontserrat,
  );

  final TextStyle blackItalicMontserrat = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    fontFamily: constants.fontMontserrat,
  );

  //Manrope font styles
  final TextStyle extraLightManrope = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w200,
    fontFamily: constants.fontManrope,
  );

  final TextStyle lightManrope = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w300,
    fontFamily: constants.fontManrope,
  );

  final TextStyle regularManrope = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w400,
    fontFamily: constants.fontManrope,
    fontSize: sizes.fontRatio * 14,
  );

  final TextStyle mediumManrope = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w500,
    fontFamily: constants.fontManrope,
  );

  final TextStyle semiBoldManrope = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w600,
    fontFamily: constants.fontManrope,
  );

  final TextStyle boldManrope = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w700,
    fontFamily: constants.fontManrope,
  );

  final TextStyle extraBoldManrope = TextStyle(
    color: colors.primaryDark,
    fontWeight: FontWeight.w800,
    fontFamily: constants.fontManrope,
  );
}
