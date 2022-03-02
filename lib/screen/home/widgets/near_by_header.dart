import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NearByHeader extends StatelessWidget {
  const NearByHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      height: sizes.heightRatio * 100,
      child: Stack(
        children: [
          Row(
            children: [
              Spacer(),
              Image.asset(assets.mapCardBG),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colors.primaryLight.withOpacity(1),
                  colors.primaryLight.withOpacity(0),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                horizontalSpacer(20),
                HeadingLargeText(
                  'Nearby stores',
                  color: colors.accentPrimary,
                ),
                Spacer(),
                SvgPicture.asset(
                  assets.icFilledLocation,
                ),
                horizontalSpacer(10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
