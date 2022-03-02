import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewAppBar extends StatelessWidget {
  final Function onCross;
  final String title;

  const ReviewAppBar(this.title, {Key key, this.onCross}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: sizes.width * 0.8,
            child: HeadingLargeText(
              title,
              color: colors.primaryLight,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: onCross,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SvgPicture.asset(
                assets.icCross,
                color: colors.primaryLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
