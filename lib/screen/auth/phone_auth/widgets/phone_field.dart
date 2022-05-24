import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aactivpay/export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NumberField extends StatelessWidget {
  const NumberField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetX<PhoneAuthController>(builder: (controller) {
          return Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: horizontalValue(18)),
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: controller.isFocus.value
                      ? colors.accentPrimary
                      : colors.white),
            ),
            child: Row(
              children: [
                getCountryCode(),
                horizontalSpacer(13),
                inputField(),
                GetX<PhoneAuthController>(builder: (controller) {
                  return Visibility(
                    visible: controller.isError.value,
                    child: SvgPicture.asset(assets.icError),
                  );
                }),
              ],
            ),
          );
        }),
        getErrorText(),
      ],
    );
  }

  Widget inputField() => Expanded(
        child: GetX<PhoneAuthController>(builder: (controller) {
          return Focus(
            child: TextFormField(
              autofocus: false,
              style: textStyles.bodyRegular,
              keyboardType: TextInputType.phone,
              controller: controller.phoneNumberController.value,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(controller.phoneNumMaxLength)
              ],
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                hintStyle: textStyles.bodyRegular.copyWith(
                  color: colors.primaryDark.withOpacity(0.5),
                  fontSize: sizes.fontRatio * 16,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
            onFocusChange: (hasFocus) {
              controller.isFocus.value = hasFocus;
            },
          );
        }),
      );

  Widget getCountryCode() {
    return Text(
      constants.countryCode,
      style: textStyles.bodyRegular,
    );
  }

  Widget getVerticalLine() {
    return VerticalDivider(
      width: 30,
      indent: 12,
      endIndent: 12,
      color: colors.primaryDark,
    );
  }

  Widget getErrorText() {
    return GetX<PhoneAuthController>(
      builder: (controller) {
        return Visibility(
          visible: controller.isError.value,
          child: Text(
            'Enter a valid phone number',
            style: textStyles.bodyExtraSmall
                .copyWith(fontSize: sizes.fontRatio * 12, color: colors.error),
          ),
        );
      },
    );
  }
}
