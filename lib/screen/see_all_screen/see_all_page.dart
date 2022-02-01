import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeAllPage extends GetView<SeeAllController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryLight,
      body: Container(
        height: sizes.height,
        width: sizes.width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            verticalSpacer(20),
            controller.components.getAppBar(controller.onBack),
            verticalSpacer(10),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Container(
                  height: 170,
                  child: SmallCard(),
                ),
                // MediumCard(data: controller.data[index]),
                separatorBuilder: (context, index) => verticalSpacer(20),
                itemCount: controller.data.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
