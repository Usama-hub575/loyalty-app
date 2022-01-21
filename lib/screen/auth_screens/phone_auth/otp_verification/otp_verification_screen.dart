import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class OTPVerificationScreen extends GetView<OTPVerificationController> {
  @override
  Widget build(BuildContext context) {
    controller.initialize();
    return Scaffold(
      backgroundColor: colors.white,
      body: Stack(
        children: [
          shader(top: -30, left: -30),
          shader(bottom: -30, right: -30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
            height: sizes.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpacer(40),
                controller.component.getBackButton(controller.onBack),
                verticalSpacer(20),
                controller.component.getTitle(),
                verticalSpacer(10),
                controller.component.getDetailText(),
                verticalSpacer(40),
                controller.component.getPinCodeField(
                  context,
                  controller.verificationCodeController,
                  controller.onConfirmTap,
                  controller.isOTPValid,
                ),
                verticalSpacer(30),
                Obx(
                  () => controller.component.getPinTimer(
                    controller.seconds.value,
                    controller.onTimeComplete,
                  ),
                ),
                verticalSpacer(18),
                Obx(
                  () => controller.component.getResendButton(
                    controller.isResendActive.value,
                    controller.onResend,
                  ),
                ),
                Spacer(),
                Obx(
                  () => LongButton(
                    onPressed: controller.onConfirmTap,
                    text: 'Confirm',
                    enable: controller.isButtonActive.value,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
