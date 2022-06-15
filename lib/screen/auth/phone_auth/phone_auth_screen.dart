import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class PhoneAuthScreen extends GetView<PhoneAuthController> {
  @override
  Widget build(BuildContext context) {
    controller.initialize();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colors.primaryLight,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(20.0), vertical: verticalValue(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(83),
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
              verticalSpacer(70),
              NumberField(),
              verticalSpacer(50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: Obx(
                        () => Checkbox(
                          value: controller.isCheck.value,
                          onChanged: (value) => controller.onTapCheckBox(value),
                          checkColor: colors.accentPrimary,
                          fillColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
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
                  ),*/
                  Padding(
                    padding: EdgeInsets.only(top: verticalValue(4)),
                    child: Obx(
                      () => CustomCheckbox(
                        onChange: () => controller.onTapCheckBox(),
                        isChecked: controller.isCheck.value,
                      ),
                    ),
                  ),
                  horizontalSpacer(10),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(top: verticalValue(3)),
                    child: RichText(
                      text: TextSpan(
                          text: constants.termAndConditionsText,
                          style: textStyles.bodyExtraSmall.copyWith(
                            color: colors.primaryDark,
                          ),
                          children: [
                            TextSpan(
                              text: constants.termsAndCondition,
                              style: textStyles.bodyExtraSmall.copyWith(
                                color: colors.accentPrimary,
                              ),
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {
                                  controller.navigateToTermsAndConditionsPage();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: horizontalValue(3),
                                      right: horizontalValue(3),
                                      bottom: verticalValue(1)),
                                  child: SvgPicture.asset(
                                    assets.icTermConditionLink,
                                    height: 10,
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: " and ",
                              style: textStyles.bodyExtraSmall.copyWith(
                                color: colors.primaryDark,
                              ),
                            ),
                            TextSpan(
                              text: constants.privacyPolicy,
                              style: textStyles.bodyExtraSmall.copyWith(
                                color: colors.accentPrimary,
                              ),
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {
                                  controller.navigateToTermsAndConditionsPage();
                                },
                                child: Padding(
                                  padding:  EdgeInsets.only(
                                      left: horizontalValue(3),
                                      right: horizontalValue(3),
                                      bottom: verticalValue(1)),
                                  child: SvgPicture.asset(
                                    assets.icTermConditionLink,
                                    height: 10,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  )),
                ],
              ),
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
      ),
    );
  }
}
