import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoodReview extends StatelessWidget {
  final String text1, text2;
  final TextEditingController feedbackController;

  const GoodReview(this.text1, this.text2, this.feedbackController, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyLargeText(
          text1,
          color: colors.white,
        ),
        BodyLargeText(
          text2,
          color: colors.white,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:
                    'Invite your friends to enjoy your free 10 points worth of discounts',
                style: textStyles.bodyRegular.copyWith(
                  color: colors.white,
                ),
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding:  EdgeInsets.only(left: horizontalValue(4), top: verticalValue(4)),
                      child: SvgPicture.asset(assets.icCoin),
                    ),
                    alignment: PlaceholderAlignment.middle,
                  )
                ]),
          ),
        ),
        verticalSpacer(30),
        FeedBackField(
          feedbackController,
          hint: 'Whats on your mind!',
        ),
      ],
    );
  }

  Widget getIcon(String icon, color) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 12,
      child: SvgPicture.asset(icon),
    );
  }
}
