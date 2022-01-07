import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aactivpay/export.dart';

class SplashComponents {
  Widget getSplashLogo() {
    return SvgPicture.asset(
      assets.icSplash,
      width: sizes.width * 0.65,
      fit: BoxFit.fitWidth,
    );
  }

  Widget getaactivpayLogo() {
    return SvgPicture.asset(
      assets.icAactivpay,
      width: sizes.width * 0.65,
      fit: BoxFit.fitWidth,
    );
  }
}
