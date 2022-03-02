import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class RateStore extends StatelessWidget {
  final Function onTap;

  const RateStore({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizes.width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors.white,
          border: Border(
            bottom: BorderSide(
              color: colors.primaryDark.withOpacity(0.02),
              width: 2,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingRegularText('Rate this store'),
            BodyLargeText('Tell others what you think'),
            verticalSpacer(20),
            RatingStar(
              0,
              itemPadding: 15,
              itemSize: 20,
            ),
            verticalSpacer(20),
            BodyLargeText(
              'Write a review',
              color: colors.accentPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
