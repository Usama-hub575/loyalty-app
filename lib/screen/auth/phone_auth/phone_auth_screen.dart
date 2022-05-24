import 'package:flutter/cupertino.dart';
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
            verticalSpacer(40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: Obx(
                          () => Checkbox(
                        value: controller.isCheck.value,
                        onChanged: (value) => controller.onTapCheckBox(value),
                        checkColor: colors.accentPrimary,
                        fillColor:
                        MaterialStateProperty.all(Colors.transparent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (_) => BorderSide(
                            width: 2.5,
                            color: controller.isCheck.value
                                ? colors.accentPrimary
                                : colors.primaryDark.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpacer(10),
                Expanded(
                    child: RichText(
                  text: TextSpan(
                      text: constants.termAndConditionsText,
                      style: textStyles.bodyLarge.copyWith(
                        color: colors.primaryDark,
                      ),
                      children: [
                        TextSpan(
                         text: constants.termsAndCondition,
                          style: textStyles.bodyLarge.copyWith(
                            color: colors.accentPrimary,
                          ),
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: (){
                              controller.navigateToTermsAndConditionsPage();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 3, right: 3,bottom: 3),
                              child: SvgPicture.asset(
                                assets.icTermConditionLink,
                                height: 15,
                              ),
                            ),
                          ),
                        ),
                        TextSpan(text: " and "),
                        TextSpan(
                          text: constants.privacyPolicy,
                          style: textStyles.bodyLarge.copyWith(
                            color: colors.accentPrimary,
                          ),
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: (){
                              controller.navigateToTermsAndConditionsPage();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 3, right: 3,bottom: 3),
                              child: SvgPicture.asset(
                                assets.icTermConditionLink,
                                height: 15,
                              ),
                            ),
                          ),
                        ),
                      ]),
                )),
              ],
            ),
            Spacer(),
            Obx(
              () => LongButton(
                constants.continueText,
                enable: controller.isButtonActive.value ,
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
