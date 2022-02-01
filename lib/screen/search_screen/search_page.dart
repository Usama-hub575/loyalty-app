import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            controller.component.getBackGroundImage(),
            controller.component.getTopGradient(),
            Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  verticalSpacer(30),
                  controller.component.getAppBar(onBack: controller.onBack),
                  verticalSpacer(40),
                  // SearchField(
                  //   readOnly: false,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
