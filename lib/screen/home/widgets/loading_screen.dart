import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoadingScreen extends StatelessWidget {
  const HomeLoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return getLoader();*/
    return getShimmerLoader();
  }

  Widget getShimmerLoader() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getMapCard(
            assets.icLocationFilled,
          ),
          verticalSpacer(20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                getStoreCard(),
                getStoreCard(),
                getStoreCard(),
                getStoreCard(),
                getStoreCard(),
              ],
            ),
          ),
          getMapCard(
            assets.icCategories,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10),
            child: Wrap(
              children: [
                getPills(80),
                getPills(90),
                getPills(80),
                getPills(100),
                getPills(110),
                getPills(100),
                getPills(70),
                getPills(90),
                getPills(100),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                getStoreCard(),
                getStoreCard(),
                getStoreCard(),
                getStoreCard(),
                getStoreCard(),
              ],
            ),
          ),
          getMapCard(
            assets.icMedal,
          ),
        ],
      ),
    );
  }

  getMapCard(String icon) {
    return Container(
      width: sizes.width,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(40),
              Container(
                width: sizes.width * 0.60,
                height: 10,
                color: colors.primaryDark.withOpacity(0.2),
              ),
              verticalSpacer(6),
              Container(
                width: sizes.width * 0.30,
                height: 10,
                color: colors.primaryDark.withOpacity(0.2),
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset(icon),
        ],
      ),
    );
  }

  getStoreCard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: sizes.heightRatio * 120,
            width: sizes.widthRatio * 180,
            color: colors.primaryDark.withOpacity(0.1),
          ),
          verticalSpacer(20),
          Container(
            height: sizes.heightRatio * 10,
            width: sizes.widthRatio * 120,
            color: colors.primaryDark.withOpacity(0.1),
          )
        ],
      ),
    );
  }

  getPills(width) {
    return Padding(
      padding: EdgeInsets.only(left: 10, bottom: 8),
      child: Container(
        width: sizes.widthRatio * width,
        height: sizes.heightRatio * 30,
        decoration: BoxDecoration(
          color: colors.primaryDark.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget getLoader() {
    return Center(
      child: CircularProgressIndicator(
        color: colors.primaryDark.withOpacity(0.1),
        strokeWidth: 3,
      ),
    );
  }
}
