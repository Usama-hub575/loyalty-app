import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String geoAddress;
  final bool hasMultipleBranches;
  final Function onSeeAllBranch;

  const LocationCard(
    this.geoAddress, {
    Key key,
    this.hasMultipleBranches,
        this.onSeeAllBranch
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      height: sizes.heightRatio * (hasMultipleBranches ? 120 : 100),
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
                  child: BodyRegularText(geoAddress ?? ''),
                ),
                hasMultipleBranches ? verticalSpacer(8) : SizedBox.shrink(),
                hasMultipleBranches
                    ? GestureDetector(
                  onTap: onSeeAllBranch,
                      child: BodySmallText(
                          'See all branches',
                          color: colors.accentPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                    )
                    : SizedBox.shrink()
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
