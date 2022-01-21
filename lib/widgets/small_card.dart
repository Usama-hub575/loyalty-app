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
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getStoreImage(),
              verticalSpacer(12),
              Row(
                children: [
                  horizontalSpacer(12),
                  getStoreName(),
                  Spacer(),
                  getPoints(),
                  horizontalSpacer(12),
                ],
              ),
              verticalSpacer(12),
              getRatingBox(),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: getStoreLogo(assets.storeLogo),
          ),
        ],
      ),
    );
  }

  getStoreLogo(String storeLogo) {
    return CircleAvatar(
      radius: sizes.widthRatio * 24,
      backgroundImage: AssetImage(
        storeLogo,
      ),
    );
  }

  Widget getRatingBox() {
    return Container(
      width: sizes.widthRatio * 60,
      height: sizes.heightRatio * 20,
      margin: EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: colors.appColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getIcon(assets.icStar),
          horizontalSpacer(10),
          getText('4.5'),
        ],
      ),
    );
  }

  Widget getText(String text) {
    return Text(
      text,
      style: textStyles.semiBoldManrope.copyWith(color: colors.white),
    );
  }

  Widget getIcon(String icon) {
    return SvgPicture.asset(
      icon,
    );
  }

  Widget getPoints() {
    return Text(
      '580 Points',
      style: textStyles.regularManrope,
    );
  }

  Widget getStoreName() {
    return Text(
      'Euru Store',
      style: textStyles.extraBoldMontserrat.copyWith(
        fontSize: 18,
      ),
    );
  }

  Widget getStoreImage() {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: colors.appColor,
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
