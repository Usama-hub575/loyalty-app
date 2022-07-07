import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';

class StoreAppBar extends StatelessWidget {
  final Function onCross;
  final String name;

  const StoreAppBar(this.name, {Key key, this.onCross}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (name.length > 12) {
      return Row(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: horizontalValue(20),
              right: horizontalValue(10),
            ),
            width: sizes.width * 0.75,

            child: Marquee(
              text: name,
              style: TextStyle(fontWeight: FontWeight.w800,
                fontFamily: constants.fontMontserrat,
                fontSize: sizes.fontRatio * 27,
              ),
              fadingEdgeEndFraction: 0.2,
              scrollAxis: Axis.horizontal,
              blankSpace: 36.0,
              velocity: 100.0,
              accelerationDuration: Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(seconds: 1),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: horizontalValue(20)),
            child: AppIconButton(
              assets.icCross,
              onTap: onCross,
            ),
          ),
        ],
      );
    }
    else {
        return Row(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: horizontalValue(20),
                right: horizontalValue(10),
              ),
              width: sizes.width * 0.75,

              child: HeadingLargeText(
                name,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: horizontalValue(20)),
              child: AppIconButton(
                assets.icCross,
                onTap: onCross,
              ),
            ),
          ],
        );
      };
  }
}
