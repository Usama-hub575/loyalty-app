import 'package:aactivpay/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CustomDrawerItem extends StatelessWidget {
  final String icon;
  final String title;
   CustomDrawerItem({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizes.heightRatio * 50,
      color: colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:horizontalValue(20)),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            horizontalSpacer(11),
            BodySmallText(title)
          ],
        ),
      ),
    );
  }
}
