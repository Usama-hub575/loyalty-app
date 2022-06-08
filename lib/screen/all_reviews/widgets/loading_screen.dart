import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class ReviewLoadingScreen extends StatelessWidget {
  const ReviewLoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getLoader();
    // return getShimmerLoader();
  }

  Widget getShimmerLoader() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Shimmer.fromColors(
        baseColor: colors.primaryDark.withOpacity(0.2),
        highlightColor: colors.primaryDark.withOpacity(0.5),
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
              padding:  EdgeInsets.only(top: verticalValue(10), left: horizontalValue(10)),
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
                color: colors.primaryDark,
              ),
              verticalSpacer(6),
              Container(
                width: sizes.width * 0.30,
                height: 10,
                color: colors.primaryDark,
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
            color: colors.primaryDark,
          ),
          verticalSpacer(20),
          Container(
            height: sizes.heightRatio * 10,
            width: sizes.widthRatio * 120,
            color: colors.primaryDark,
          )
        ],
      ),
    );
  }

  getPills(width) {
    return Padding(
      padding: EdgeInsets.only(left: horizontalValue(10), bottom: verticalValue(8)),
      child: Container(
        width: sizes.widthRatio * width,
        height: sizes.heightRatio * 30,
        decoration: BoxDecoration(
          color: colors.primaryDark,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget getLoader() {
    return Center(
      child: CircularProgressIndicator(
        color: colors.accentPrimary,
        strokeWidth: 3,
      ),
    );
  }
}
