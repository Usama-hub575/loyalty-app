import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class OnboardingPage extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    controller.initialize();
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => PageView.builder(
              controller: controller.pageController,
              physics: ClampingScrollPhysics(),
              onPageChanged: (value) {
                controller.updatePage(value: value);
              },
              itemBuilder: (BuildContext context, int index) {
                return controller.pageChildren[controller.currentPage.value];
              },
              itemCount: controller.pageChildren.length,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: sizes.heightRatio * 225,
              color: colors.accentPrimary,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => HeadingLargeText(
                        controller.title.value,
                        color: colors.primaryLight,
                      )),
                  verticalSpacer(5),
                  Obx(() => BodyRegularText(
                        controller.subTitle.value,
                        color: colors.primaryLight,
                      )),
                  Spacer(),
                  Obx(() => PageIndicator(controller.currentPage.value)),
                  verticalSpacer(30),
                  Obx(
                    () => LongButton(
                      controller.buttonTitle.value,
                      onPressed: controller.updatePage,
                      backgroundColor: colors.primaryLight,
                      textColor: colors.accentPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
