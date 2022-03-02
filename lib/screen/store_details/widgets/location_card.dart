import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      height: sizes.heightRatio * 120,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 20,
            child: Image.asset(
              assets.mapCardBG,
              fit: BoxFit.fill,
            ),
          ),
          getGradient(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingRegularText('Location'),
                verticalSpacer(10),
                Container(
                  width: sizes.width * 0.6,
                  child: BodyRegularText(
                      '170, Saiden Shah Colony Upper Mall Scheme, Lahore'),
                ),
                verticalSpacer(8),
                BodySmallText(
                  'See 5 more branches',
                  color: colors.accentPrimary,
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  getGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors.primaryLight,
            colors.primaryLight,
            colors.transparent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}
