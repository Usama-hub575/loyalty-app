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
    return Row(
      children: [
        Expanded(
          child: Container(
            padding:EdgeInsets.symmetric(horizontal: 15),
            child: name.length > 16
                ? Marquee(
                    text: name.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: constants.fontMontserrat,
                      fontSize: sizes.fontRatio * 28,
                    ),
                    scrollAxis: Axis.horizontal,
                    blankSpace: 42.0,
                    velocity: 100.0,
                    accelerationDuration: Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: Duration(seconds: 1),
                    decelerationCurve: Curves.easeOut,
                  )
                : HeadingLargeText(
                    name,
                  ),
          ),
        ),
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
}
