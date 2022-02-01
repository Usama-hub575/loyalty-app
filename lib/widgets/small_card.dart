import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SmallCard extends StatelessWidget {
  final data;
  final onTap;

  const SmallCard({Key key, this.data, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              getStoreName(),
              horizontalSpacer(5),
              getIcon(assets.icStar),
              horizontalSpacer(2),
              getPoints('4.1/5'),
              horizontalSpacer(5),
              getIcon(assets.icCoin),
              horizontalSpacer(2),
              getPoints('30K'),
              Spacer(),
              getIcon(assets.icRight),
              horizontalSpacer(10),
            ],
          ),
        ],
      ),
    );
  }


  Widget getIcon(String icon) {
    return SvgPicture.asset(
      icon,
    );
  }

  Widget getPoints(text) {
    return Text(
      text,
      style: textStyles.bodyExtraSmall,
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
      height: 170,
      decoration: BoxDecoration(
        color: colors.accentPrimary,
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
