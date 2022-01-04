import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/export.dart';

class OnboardingPage extends GetView<OnboardingController> {
  OnboardingComponents components = OnboardingComponents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: verticalValue(260),
                child: Obx(() => components.getOnboardingImage(controller.page.value)),),
            verticalSpacer(40),
            Obx(() => components.getHeadingText(controller.page.value)),
            verticalSpacer(15),
            Obx(() => components.getDetailsText(controller.page.value)),
            verticalSpacer(70),
            Obx(() => components.getIndicators(controller.page.value)),
            verticalSpacer(10),
            Obx(() => components.getSkipButton(
                  controller.page.value,
                  controller.onSkip,
                )),
            verticalSpacer(10),
            Obx(() => components.getNextButton(
                  controller.page.value,
                  controller.onNext,
                )),
          ],
        ),
      ),
    );
  }
}
