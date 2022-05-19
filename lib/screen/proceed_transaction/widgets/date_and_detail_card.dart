

import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DateAndDetailCard extends StatelessWidget {


  const DateAndDetailCard({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      padding: EdgeInsets.all(20),
      color: colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: sizes.width * 0.70,
            child: HeadingLargeText(
              'JAN 28, 2022',
              color: colors.primaryDark.withOpacity(0.2),
            ),
          ),
          Text(
            'You did a shopping of  Rs 7000. As per today’s conversion rate, you will receive discount of Rs 30',
            style: textStyles.bodyLarge,
          ),
          verticalSpacer(20),
          Text(
            'Points = 7000 / 100 = 70 pts',
            style: textStyles.bodyLarge,
          ),

        ],
      ),
    );
  }
}
