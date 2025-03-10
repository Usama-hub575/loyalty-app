import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class OTPVerificationScreen extends GetView<OTPVerificationController> {
  @override
  Widget build(BuildContext context) {
    controller.initialize();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colors.primaryLight,
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(20), vertical: verticalValue(20)),
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
                      color: controller.isResendActive.value
                          ? colors.primaryDark
                          : colors.primaryDark.withOpacity(0.5),
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
      ),
    );
  }
}
