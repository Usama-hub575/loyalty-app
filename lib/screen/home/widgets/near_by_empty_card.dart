import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NearByEmptyCard extends StatelessWidget {

  final LocationModel address;

  const NearByEmptyCard(this.address, {Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: colors.white,
      child: Column(
        children: [
          HeadingLargeText('there isn’t any Nearby store available 💔'),
          HeadingRegularText(
            address.geoAddress,
            color: colors.primaryDark.withOpacity(0.3),
          ),
          verticalSpacer(20),
        ],
      ),
    );
  }
}
