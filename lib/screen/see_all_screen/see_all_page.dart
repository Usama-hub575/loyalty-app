import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SeeAllPage extends GetView<SeeAllController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: ListView.separated(
                itemBuilder: (context, index) => Container(
                  height: 170,
                  child: FullWidthCard(),
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
