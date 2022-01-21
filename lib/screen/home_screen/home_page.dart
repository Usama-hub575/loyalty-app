import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colors.background,
      body: Container(
        height: sizes.height,
        width: sizes.width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            verticalSpacer(30),
            AppbarWidget(),
            verticalSpacer(30),
            SearchField(),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  verticalSpacer(10),
                  controller.components.getScrollingPills(
                    controller.pillsList,
                    controller.onPillsTap,
                  ),
                  verticalSpacer(30),
                  controller.components.getRecommendedList(
                    title: 'Recommended for you',
                    data: controller.pillsList,
                    onSeeAll: controller.openSeeAllPage,
                  ),
                  verticalSpacer(30),
                  controller.components.getRecommendedList(
                    title: 'Recently Visited',
                    data: controller.pillsList,
                    onSeeAll: controller.openSeeAllPage,
                  ),
                  verticalSpacer(30),
                  controller.components.getNearByList(
                    title: 'Nearby Stores',
                    data: controller.pillsList,
                    onSeeAll: controller.openSeeAllPage,
                  ),
                  verticalSpacer(20),
                  controller.components.getMapCard(
                    title: 'Explore around you',
                  ),
                  verticalSpacer(20),
                  controller.components.getPopularList(
                    title: 'Popular Stores',
                    data: controller.pillsList,
                    onSeeAll: controller.openSeeAllPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: controller.components.getFloatingActionButton(
        onPressed: () => controller.openBottomSheet(
          context,
          this._scaffoldKey.currentState,
        ),
      ),
    );
  }
}
