import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class AllStoresLoadingScreen extends StatelessWidget {
  const AllStoresLoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return getLoader();*/
    return getShimmerLoader();
  }

  Widget getShimmerLoader() {
    return Column(
      children: [
        verticalSpacer(30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalValue(20),vertical: verticalValue(10)),
          child: AppBarWidget(
            title: 'Stores',
            onBack: (){},
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: horizontalValue(20), top: verticalValue(30)),
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
                verticalSpacer(20),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      getStoreCard(),
                      getStoreCard(),
                      getStoreCard(),
                      getStoreCard(),
                      getStoreCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getStoreCard() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: horizontalValue(50), vertical: verticalValue(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: sizes.heightRatio * 120,
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
      padding: EdgeInsets.only(left: horizontalValue(10), bottom: verticalValue(8)),
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
