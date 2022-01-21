import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aactivpay/export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PhoneAuthComponent {
  Widget getWelcomeText() {
    return Text(
      'Welcome',
      style: textStyles.extraBoldMontserrat.copyWith(
        fontSize: 28,
      ),
    );
  }

  Widget getDetailText() {
    return Text(
      'Sign in to AactivPay to get amazing discounts',
      style: textStyles.regularManrope,
    );
  }

  Widget getContinueButton(onPressed) {
    return LongButton(
      text: 'Continue',
      onPressed: onPressed,
    );
  }

  Widget getNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colors.appColor),
          ),
          child: Row(
            children: [
              getIcon(assets.icPhone),
              horizontalSpacer(20),
              getCountryCode(),
              horizontalSpacer(10),
              getIcon(assets.icDropDown),
              getVerticalLine(),
              inputField(),
              GetX<PhoneAuthController>(builder: (controller) {
                return Visibility(
                  visible: controller.isError.value,
                  child: getIcon(assets.icError),
                );
              }),
            ],
          ),
        ),
        getErrorText(),
      ],
    );
  }

  Widget inputField() => Expanded(
        child: GetX<PhoneAuthController>(builder: (controller) {
          return TextFormField(
            autofocus: true,
            style: textStyles.regularManrope.copyWith(
              color: colors.primaryDark,
              fontSize: sizes.fontRatio * 16,
            ),
            keyboardType: TextInputType.phone,
            controller: controller.phoneNumberController.value,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(controller.phoneNumMaxLength)
            ],
            decoration: InputDecoration(
              hintText: '3XXXXXXXXX',
              hintStyle: textStyles.regularManrope.copyWith(
                color: colors.grey.withOpacity(0.5),
                fontSize: sizes.fontRatio * 14,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          );
        }),
      );

  Widget getIcon(String icon) {
    return SvgPicture.asset(icon);
  }

  Widget getCountryCode() {
    return Text(
      '+92',
      style: textStyles.regularManrope.copyWith(
        fontWeight: FontWeight.w300,
        fontSize: sizes.fontRatio * 14,
      ),
    );
  }

  Widget getVerticalLine() {
    return VerticalDivider(
      width: 30,
      indent: 12,
      endIndent: 12,
      color: colors.black,
    );
  }

  Widget getErrorText() {
    return GetX<PhoneAuthController>(
      builder: (controller) {
        return Visibility(
          visible: controller.isError.value,
          child: Text(
            'Invalid Phone Number Format (ex: 3126811743)',
            style: textStyles.regularManrope.copyWith(
                fontSize: sizes.fontRatio * 12, color: colors.errorColor),
          ),
        );
      },
    );
  }
}
