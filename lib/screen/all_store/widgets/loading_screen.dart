import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class AllStoresLoadingScreen extends StatelessWidget {
  const AllStoresLoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: horizontalValue(
          20,
        ),
      ),
      child: Column(
        children: [
          verticalSpacer(30),
          Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalValue(0),
              horizontalValue(10),
              horizontalValue(20.0),
              horizontalValue(10),
            ),
            child: AppBarWidget(
              title: 'Stores',
              onBack: () {},
            ),
          ),
          _pillsList(),
          verticalSpacer(21),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return getStoreCard();
            },
            separatorBuilder: (_, index) {
              return verticalSpacer(10);
            },
            itemCount: 3,
          ),
        ],
      ),
    );
  }

  Widget _pillsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BodyExtraSmallText(
              'Apply Now',
              color: colors.accentPrimary,
            ),
            horizontalSpacer(
              5,
            ),
          ],
        ),
        Wrap(
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
      ],
    );
  }


  Widget getStoreCard() {
    return Container(
      padding: EdgeInsets.only(
        right: horizontalValue(
          20,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: sizes.heightRatio * 172,
              decoration: BoxDecoration(
                color: colors.primaryDark.withOpacity(
                  0.1,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    8,
                  ),
                  topRight: Radius.circular(
                    8,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: colors.white,
              ),
              child: Column(
                children: [
                  verticalSpacer(
                    18,
                  ),
                  Container(
                    height: sizes.heightRatio * 10,
                    width: sizes.widthRatio * 234.83,
                    decoration: BoxDecoration(
                      color: colors.primaryDark.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                        2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacer(
              18,
            ),
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
