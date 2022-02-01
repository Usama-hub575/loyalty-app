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
      backgroundColor: colors.primaryLight,
      appBar: HomeAppBar(),
      body: Container(
        height: sizes.height,
        width: sizes.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            MapCard(),
            HeadingCard(
              'popular categories',
              icon: assets.icCategories,
            ),
            FilterPills(
              dataList1: controller.pillsList1,
              dataList2: controller.pillsList2,
              dataList3: controller.pillsList3,
              onTap: controller.onPillsTap,
            ),
            StoreCard(
              controller.pillsList2,
            ),
            HeadingCard(
              'Top ratted Stores',
              icon: assets.icMedal,
            ),
            StoreCard(
              controller.pillsList3,
            ),
            verticalSpacer(20),
            InviteCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingAction(
        onPressed: () => controller.openBottomSheet(
          context,
          this._scaffoldKey.currentState,
        ),
      ),
    );
  }
}
