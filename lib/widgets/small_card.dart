import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SmallCard extends StatelessWidget {
  final Store data;
  final onTap;

  const SmallCard({Key key, this.data, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizes.widthRatio * 230,
        margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: colors.primaryLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getStoreImage(),
            verticalSpacer(12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                horizontalSpacer(12),
                getStoreName(data.name),
                Spacer(),
                getIcon(assets.icStar),
                horizontalSpacer(2),
                getPoints('${data.rating}/5'),
                horizontalSpacer(5),
                getIcon(assets.icCoin),
                horizontalSpacer(2),
                getPoints(' 30K'),
                horizontalSpacer(10),
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

  Widget getStoreName(name) {
    return Container(
      width: sizes.widthRatio * 120,
      child: Text(
        name,
        style: textStyles.bodyRegular,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget getStoreImage() {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: colors.primaryLight,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            assets.storeImage,
          ),
        ),
      ),
    );
  }
}
