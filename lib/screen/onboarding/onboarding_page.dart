import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class OnboardingPage extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    controller.initialize();
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => controller.pageChildren[controller.currentPage.value],
          ),
          Align(
            alignment: Alignment.bottomLeft,
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
