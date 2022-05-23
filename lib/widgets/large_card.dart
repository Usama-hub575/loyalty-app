import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LargeCard extends StatelessWidget {
  final Store data;
  final onTap;

  const LargeCard({Key key, this.data, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizes.width,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getStoreImage(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  horizontalSpacer(8),
                  getStoreName(data.name),
                  horizontalSpacer(5),
                  getIcon(assets.icCoin),
                  horizontalSpacer(2),
                  getPoints(data.redeemLimit.toString()),
                  horizontalSpacer(5),
                  getIcon(assets.icStar),
                  horizontalSpacer(2),
                  getPoints('${data.rating}/5'),],
              ),
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

  Widget getStoreName(String name) {
    return Text(
      name,
      style: textStyles.bodyRegular,
    );
  }

  Widget getStoreImage() {
    return Container(
      height: sizes.heightRatio * 172,
      width: sizes.width,
      decoration: BoxDecoration(
        color: colors.primaryLight,
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        image: DecorationImage(
          image: data.imageUrl==null || data.imageUrl.isEmpty? AssetImage(assets.storeLongImage) :NetworkImage(
            data.imageUrl,
          ),
          fit: BoxFit.fill
        ),
      ),
    );
  }
}
