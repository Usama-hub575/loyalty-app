import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FullWidthCard extends StatelessWidget {
  final data;
  final onTap;

  const FullWidthCard({Key key, this.data, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage(assets.fullStoreImage), fit: BoxFit.fill),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: getButtomGradient(),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Spacer(),
                    getPoints('580 Points'),
                  ],
                ),
                verticalSpacer(18),
                Row(
                  children: [
                    Spacer(),
                    getPoints('15%'),
                  ],
                ),
                Spacer(),
                getStoreName(),
                verticalSpacer(10),
                getRating(),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: getLogo(assets.storeLogo),
          ),
        ],
      ),
    );
  }

  Widget getButtomGradient() {
    return Container(
      height: sizes.heightRatio * 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: <Color>[
            colors.primaryDark.withOpacity(0.1),
            colors.primaryDark.withOpacity(0.3),
            colors.primaryDark.withOpacity(0.5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
    );
  }

  Widget getLogo(String storeLogo) {
    return CircleAvatar(
      radius: sizes.widthRatio * 24,
      backgroundImage: AssetImage(
        storeLogo,
      ),
    );
  }

  Widget getRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getIconValue(assets.icStar),
        horizontalSpacer(10),
        getTextValue('4.5'),
      ],
    );
  }

  Widget getTextValue(String text) {
    return Text(
      text,
      style: textStyles.semiBoldManrope.copyWith(color: colors.white),
    );
  }

  Widget getIconValue(String icon) {
    return SvgPicture.asset(
      icon,
    );
  }

  Widget getPoints(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: colors.appColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: textStyles.semiBoldManrope.copyWith(
          color: colors.white,
          fontSize: sizes.fontRatio * 14,
        ),
      ),
    );
  }

  Widget getStoreName() {
    return Text(
      'Euru Store',
      style: textStyles.extraBoldMontserrat.copyWith(
        fontSize: 18,
        color: colors.white,
      ),
    );
  }
}
