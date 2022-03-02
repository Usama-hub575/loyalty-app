import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: colors.white,
        border: Border(
          top: BorderSide(
            color: colors.primaryDark.withOpacity(0.02),
            width: 2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(assets.icFb),
          horizontalSpacer(42),
          SvgPicture.asset(assets.icTwiter),
          horizontalSpacer(42),
          SvgPicture.asset(assets.icBrowser),
        ],
      ),
    );
  }
}
