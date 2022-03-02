import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LargeCard extends StatelessWidget {
  final data;
  final onTap;

  const LargeCard({Key key, this.data, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizes.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: colors.primaryLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getStoreImage(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                horizontalSpacer(15),
                getStoreName(),
                horizontalSpacer(5),
                getIcon(assets.icStar),
                horizontalSpacer(2),
                getPoints('4.1/5'),
                horizontalSpacer(5),
                getIcon(assets.icCoin),
                horizontalSpacer(2),
                getPoints(' 30K'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getIcon(String icon) {
    return SvgPicture.asset(
      icon,
      width: 10,
      height: 10,
    );
  }

  Widget getPoints(text) {
    return BodyExtraSmallText(
      text,
      size: 8,
    );
  }

  Widget getStoreName() {
    return Text(
      'Euru Store',
      style: textStyles.bodyRegular,
    );
  }

  Widget getStoreImage() {
    return Container(
      height: sizes.heightRatio * 130,
      width: sizes.width,
      decoration: BoxDecoration(
        color: colors.primaryLight,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
            assets.storeLongImage,
          ),
        ),
      ),
    );
  }
}
