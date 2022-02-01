import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeadingCard extends StatelessWidget {
  final String title, icon;

  const HeadingCard(this.title, {Key key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      color: colors.accentPrimary,
      padding: EdgeInsets.only(top: 5, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 20, top: 10),
            width: sizes.width * 0.7,
            child: HeadingLargeText(
              title,
              color: colors.tieYellow,
            ),
          ),
          Spacer(),
          SvgPicture.asset(icon),
        ],
      ),
    );
  }
}
