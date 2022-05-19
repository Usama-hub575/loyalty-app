

import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivateCard extends StatelessWidget {


  const ActivateCard({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      padding: EdgeInsets.all(20),
      color: colors.error.withOpacity(0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: sizes.width * 0.70,
                child: HeadingLargeText(
                  'Activate your points',
                  color: colors.primaryDark.withOpacity(0.2),
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                assets.icMoneyBag,
              ),
            ],
          ),
          Text(
            'Upload complete receipt of transaction to activate your points.',
            style: textStyles.headingRegular,
          ),
        ],
      ),
    );
  }
}
