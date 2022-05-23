import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class OTPVerificationScreen extends GetView<OTPVerificationController> {
  @override
  Widget build(BuildContext context) {
    controller.initialize();
    return Scaffold(
      backgroundColor: colors.primaryLight,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: sizes.height,
        width: sizes.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpacer(30),
            AppBarWidget(
              title: 'Verification',
              onBack: controller.onBack,
            ),
            verticalSpacer(30),
            RichTextWidget(
              number: controller.params.number,
            ),
            verticalSpacer(46),
            PinCodeField(
              context,
              controller.verificationCodeController,
              controller.onConfirmTap,
              controller.isOTPValid,
            ),
            verticalSpacer(40),
            Obx(() => CustomTimer(
                  seconds: controller.seconds.value,
                  onTimeComplete: controller.onTimeComplete,
                  timeController: controller.timerController,
                )),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BodyLargeText(
                    "Didn’t receive code?",
                  ),
                  TextButton(
                    onPressed: controller.isResendActive.value
                        ? controller.onResend
                        : null,
                    child: BodyLargeText(
                      'Request again',
                      color: controller.isResendActive.value
                          ? colors.accentPrimary
                          : colors.accentPrimary.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Obx(
              () => LongButton(
                constants.verify,
                onPressed: controller.onConfirmTap,
                enable: controller.isButtonActive.value,
                isLoading: controller.isLoading.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
