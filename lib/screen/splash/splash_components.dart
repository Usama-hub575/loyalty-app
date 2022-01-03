import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loyalty/export.dart';

class SplashComponents {
  Widget getLabsterLogo() {
    return Hero(
      tag: 'splash',
      child: SvgPicture.asset(
        assets.icFacebook,
        width: sizes.width * 0.65,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
