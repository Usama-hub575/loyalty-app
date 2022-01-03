import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/export.dart';

class OnboardingPage extends GetView<OnboardingController> {
  OnboardingComponents components = OnboardingComponents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => components.getOnboardingImage(controller.page.value)),
          SizedBox(height: 20),
          components.getDetailsText(controller.page.value),
          SizedBox(height: 20),
          components.getSkipButton(controller.page.value),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              controller.onNext();
            },
            child: components.getNextButton(
              controller.page.value,
            ),
          ),
          SizedBox(height: 20),
          components.getStartedButton(controller.page.value),
        ],
      ),
    );
  }
}
