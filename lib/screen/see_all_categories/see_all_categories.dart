import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class SeeAllCategories extends GetView<SeeAllCategoriesController> {
  SeeAllCategories( {Key key,}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalValue(20)),
      child: Container(
        height: sizes.height,
        width: sizes.width,
        child: Column(
          children: [
            verticalSpacer(40),
            AppBarWidget(
              title: 'All Categories',
              onBack: controller.onBack,
            ),
            verticalSpacer(20),
            AllCategoriesList(
              onTap: controller.onPillsTap,
              dataList: controller.pillsList,
              pillsCount: controller.pillsList.length,
              onApply: controller.onApply,
            )
          ],
        ),
      ),
    );
  }
}
