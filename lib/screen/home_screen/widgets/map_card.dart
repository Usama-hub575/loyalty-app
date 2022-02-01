import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MapCard extends StatelessWidget {
  const MapCard({Key key}) : super(key: key);

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
                  'Turn on your GPS !',
                  color: colors.primaryDark.withOpacity(0.2),
                ),
              ),
              Spacer(),
              SvgPicture.asset(assets.icLocation),
            ],
          ),
          Text(
            'Let us know your address to find  stores in your vicinity.',
            style: textStyles.headingRegular,
          ),
          verticalSpacer(22),
          Row(
            children: [
              Text(
                'Location',
                style: textStyles.bodySmall,
              ),
              Spacer(),
              SvgPicture.asset(assets.icRight),
            ],
          ),
        ],
      ),
    );
  }
}
