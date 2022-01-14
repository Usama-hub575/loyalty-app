import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class PhoneAuthScreen extends GetView<PhoneAuthController> {
  @override
  Widget build(BuildContext context) {
    controller.initialize();
    return Scaffold(
      backgroundColor: colors.white,
      body: Stack(
        children: [
          shader(top: -30, left: -30),
          shader(bottom: -30, right: -30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacer(100),
                controller.component.getWelcomeText(),
                controller.component.getDetailText(),
                verticalSpacer(40),
                controller.component.getNumberField(),
                Spacer(),
                controller.component
                    .getContinueButton(controller.onContinueTap),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
