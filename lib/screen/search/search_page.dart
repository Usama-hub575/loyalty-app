import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: sizes.width,
              height: 30,
              color: colors.primaryLight,
            ),
            Obx(
              () => SearchField(
                controller.searchController,
                hint: 'Search store',
                onBack: controller.onBack,
                onTextChange: controller.onTextChange,
                onClear: controller.onTextClear,
                isCross: controller.isCross.value,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: HeadingRegularText('Recent search'),
            ),
            Obx(() {
              return Expanded(
                child: ListView.separated(
                  itemCount: controller.recentSearch.length,
                  itemBuilder: (context, index) {
                    return getRecentStores(
                        controller.recentSearch[index], index);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return verticalSpacer(2);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget getRecentStores(String storeName, int index) {
    return Slidable(
      enabled: true,
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        // dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            backgroundColor: colors.error,
            foregroundColor: colors.white,
            icon: Icons.clear,
            onPressed: (BuildContext context) =>
                controller.removeStoreFromRecentSearch(index),
          ),
        ],
      ),
      child: Container(
        height: sizes.heightRatio * 70,
        width: sizes.width,
        color: colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: SvgPicture.asset(assets.icStore),
              backgroundColor: colors.primaryLight,
            ),
            horizontalSpacer(10),
            BodyLargeText(storeName),
            Spacer(),
            AppIconButton(
              assets.icRight,
            ),
          ],
        ),
      ),
    );
  }
}
