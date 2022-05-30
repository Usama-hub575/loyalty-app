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
          verticalSpacer(70),
          Container(
            color: colors.white,
            child: Column(
              children: [
                getMapCard3(),
                Padding(
                  padding:  EdgeInsets.only(right: horizontalValue(10)),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: BodyExtraSmallText('Apply Now',color: colors.accentPrimary,)),
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
        ],
      ),
    );
  }

  getMapCard(String icon) {
    return Container(
      width: sizes.width,
      padding: EdgeInsets.only(left: 20, ),
      child: Stack(
        children: [
          Image.asset(
            assets.bgMapShimmer,
          ),
          Container(
            width: sizes.width / 2.2,
            height: sizes.heightRatio * 70,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: colors.primaryLight,
                spreadRadius: 10,
                blurRadius: 5,
                offset: Offset(3, 0), // changes position of shadow
              ),
            ]),
          ),
          Row(
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
              Padding(
                padding:  EdgeInsets.only(right: horizontalValue(10)),
                child: SvgPicture.asset(icon),
              ),
            ],
          )
        ],
      ),
    );
  }

  getMapCard2(String icon) {
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
                color: colors.primaryDark.withOpacity(0.1),
              ),
              verticalSpacer(6),
              Container(
                width: sizes.width * 0.30,
                height: 10,
                color: colors.primaryDark.withOpacity(0.1),
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset(icon),
        ],
      ),
    );
  }

  getMapCard3() {
    return Container(
      width: sizes.width,
      padding: EdgeInsets.only(left: horizontalValue(20)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(40),
              Container(
                width: sizes.width * 0.60,
                height: 10,
                color: colors.primaryDark.withOpacity(0.1),
              ),
              verticalSpacer(6),
              Container(
                width: sizes.width * 0.30,
                height: 10,
                color: colors.primaryDark.withOpacity(0.1),
              ),
            ],
          ),
          Spacer(),
          Container(
            width: sizes.widthRatio * 70,
            height: sizes.heightRatio * 70,
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  assets.icTriangle,
                  color: colors.primaryDark.withOpacity(0.1),
                ),
                verticalSpacer(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      assets.icBox,
                      color: colors.primaryDark.withOpacity(0.1),
                    ),
                    horizontalSpacer(5),
                    SvgPicture.asset(
                      assets.icShimmerCircle,
                      color: colors.primaryDark.withOpacity(0.1),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  getStoreCard() {
    return Padding(
      padding:  EdgeInsets.only(left: horizontalValue(20),top: verticalValue(20)),
      child: Container(
        height: sizes.heightRatio * 212,
        decoration: BoxDecoration(
            color: colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(8), bottom: Radius.circular(8))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: sizes.heightRatio * 172,
              width: sizes.widthRatio * 234,
              decoration: BoxDecoration(
                color: colors.primaryDark.withOpacity(0.1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
            ),
            verticalSpacer(20),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                height: sizes.heightRatio * 10,
                width: sizes.widthRatio * 120,
                color: colors.primaryDark.withOpacity(0.1),
              ),
            )
          ],
        ),
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
          color: colors.primaryDark.withOpacity(0.05),
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
