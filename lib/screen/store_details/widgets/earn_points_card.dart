import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class EarnPointsCard extends StatelessWidget {
  const EarnPointsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: colors.accentPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingLargeText(
            'Earn 40 more points to Get the discount of Rs 300 ',
            color: colors.tieYellow,
          ),
          verticalSpacer(20),
          getProgressContainer(320.0, 280.0),
          verticalSpacer(10),
          BodyExtraSmallText(
            'As per the terms and conditions, 10 points would be reduced for this store after 20 days',
            color: colors.primaryLight,
          )
        ],
      ),
    );
  }

  getProgressContainer(total, earned) {
    return Container(
      width: sizes.width,
      height: 30,
      decoration: BoxDecoration(
        color: colors.primaryLight,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(8),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20),
        margin: EdgeInsets.only(right: total - earned),
        decoration: BoxDecoration(
            color: colors.success,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(8),
            )),
        child: Row(children: [
          BodyExtraSmallText(
            '${earned.toInt()} / ${total.toInt()} pt',
          ),
        ]),
      ),
    );
  }
}
