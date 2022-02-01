import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class PhoneAuthScreen extends GetView<PhoneAuthController> {
  @override
  Widget build(BuildContext context) {
    controller.initialize();
    return Scaffold(
      backgroundColor: colors.primaryLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(100),
            SvgPicture.asset(
              assets.icAactivpay,
              width: sizes.widthRatio * 136,
            ),
            verticalSpacer(28),
            HeadingLargeText(constants.getStarted),
            verticalSpacer(10),
            BodyLargeText(
              constants.continueWithYourPhoneNumber,
              color: colors.primaryDark,
            ),
            verticalSpacer(40),
            NumberField(),
            Spacer(),
            Obx(
              () => LongButton(
                constants.continueText,
                enable: controller.isButtonActive.value,
                onPressed: controller.onContinueTap,
                isLoading: controller.isLoading.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
