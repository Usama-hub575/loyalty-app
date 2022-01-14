import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class OnboardingPage extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    controller.initialize();
    return Scaffold(
      backgroundColor: colors.white,
      body: Stack(
        children: [
          Obx(
            () => shader(
              top: controller.currentPage.value < 2 ? -30 : 200,
              left: controller.currentPage.value == 0 ? -30 : 200,
              right: controller.currentPage.value > 0 ? -30 : 200,
            ),
          ),
          shader(
            bottom: -30,
            left: -30,
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => PageView.builder(
                      controller: controller.pageController,
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (value) {
                        controller.updatePage(value: value);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return controller
                            .pageChildren[controller.currentPage.value];
                      },
                      itemCount: controller.pageChildren.length,
                    ),
                  ),
                ),
                verticalSpacer(30),
                Obx(() => controller.components
                    .getIndicators(controller.currentPage.value)),
                verticalSpacer(20),
                Obx(
                  () => controller.currentPage.value < 2
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalValue(40)),
                          child: Row(
                            children: [
                              controller.components.getSkipButton(
                                controller.onSkip,
                              ),
                              Spacer(),
                              controller.components.getNextButton(
                                controller.updatePage,
                              )
                            ],
                          ),
                        )
                      : controller.components.getStartedButton(
                          controller.updatePage,
                        ),
                ),
                verticalSpacer(30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
