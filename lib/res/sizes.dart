import 'package:flutter/material.dart';

class AppSizes {
   Size _screenSize;
   bool isLargeScreen;
   bool isMediumScreen;
   bool isSmallScreen;
   bool isTablet;
   bool isPhone;
   double width;
   double height;
   double topPadding;

  //For dynamic Sizing
   double widthRatio;
   double heightRatio;
   double fontRatio;

  //Dynamic Font Sizes
   double extraSmallFontSize;
   double smallFontSize;
   double mediumFontSize;
   double regularFontSize;
   double largeFontSize;
   double extraLargeFontSize;
   double jumboFontSize;

  //padding
   double smallPadding;
   double regularPadding;
   double mediumPadding;
   double pagePadding;
   double largePadding;
   double extraLargePadding;
   double largerPadding;

  //tablet specific padding
   double tabletInnerPadding;
   double tabletOuterPadding;
   double tabletPagePadding;
   double tabletLargeOuterMargin;
   double tabletExtraLargeOuterMargin;
   double tabletSocialMediaPadding;
   double tabletAuthCommentPadding;

  void initializeSize(context) {
    _screenSize = MediaQuery.of(context).size;
    topPadding = MediaQuery.of(context).padding.top;
    width = _screenSize.width;
    height = _screenSize.height;
    isLargeScreen = width > 1280;
    isMediumScreen = width > 1240 && width <= 1280;
    isSmallScreen = width > 800 && width <= 1240;
    isTablet = width > 600 && width <= 800;
    isPhone = width <= 600;
    fontRatio = isPhone
        ? _screenSize.width / 360
        : isTablet
            ? _screenSize.width / 800
            : _screenSize.width / 1280;
    widthRatio = isPhone ? _screenSize.width / 360 : _screenSize.width / 1280;
    heightRatio =
        isPhone ? _screenSize.height / 720 : _screenSize.height / 1200;
    extraSmallFontSize = 11.0 * fontRatio;
    smallFontSize = 12.0 * fontRatio;
    regularFontSize = 14.0 * fontRatio;
    mediumFontSize = 16.0 * fontRatio;
    largeFontSize = 18.0 * fontRatio;
    extraLargeFontSize = 24.0 * fontRatio;
    jumboFontSize = 32.0 * fontRatio;

    smallPadding = 4.0 * widthRatio;
    regularPadding = 8.0 * widthRatio;
    mediumPadding = 12.0 * widthRatio;
    pagePadding = 16.0 * widthRatio;
    largePadding = 24.0 * widthRatio;
    extraLargePadding = 32.0 * widthRatio;
    largerPadding = 32.0 * widthRatio;

    tabletOuterPadding = 144.0 * widthRatio;
    tabletInnerPadding = 76.0 * widthRatio;
    tabletPagePadding = 48.0 * widthRatio;
    tabletExtraLargeOuterMargin = 228.0 * widthRatio;
    tabletLargeOuterMargin = 172.0 * widthRatio;
    tabletSocialMediaPadding = 192.0 * widthRatio;
    tabletAuthCommentPadding = 99.0 * widthRatio;
  }

  void refreshSize(context) {
    _screenSize = MediaQuery.of(context).size;
    width = _screenSize.width;
    height = _screenSize.height;
  }
}
