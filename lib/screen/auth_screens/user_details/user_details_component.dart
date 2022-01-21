import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserDetailsComponent {
  getTitle() {
    return Text(
      'Register',
      style: textStyles.extraBoldMontserrat.copyWith(
        fontSize: 28,
      ),
    );
  }

  Widget getDetailText() {
    return Text(
      'Please  fill all the required field to register and get amazing discounts at stores',
      style: textStyles.regularManrope,
    );
  }

  Widget getProfileImage() {
    return Center(
      child: SvgPicture.asset(
        assets.icProfile,
        color: colors.appColor,
      ),
    );
  }

  Widget getUploadPhotoText() {
    return Center(
      child: Text(
        'Upload Photo',
        style: textStyles.boldManrope.copyWith(
          fontSize: sizes.fontRatio * 14,
          color: colors.appColor,
        ),
      ),
    );
  }

  Widget getTextField(
    String hint,
    String icon,
    TextEditingController textController,
    onTextChange, {
    bool readOnly = false,
    onTap,
  }) {
    var isFocused = false.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetX<UserDetailsController>(builder: (controller) {
          return Focus(
            onFocusChange: (focus) {
              isFocused.value = focus;
              print('isFocus: $focus');
            },
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: isFocused.value ? colors.appColor : colors.grey),
              ),
              child: Row(
                children: [
                  getIcon(icon),
                  inputField(
                      hint, textController, readOnly, onTextChange, onTap),
                  Visibility(
                    visible: controller.isError.value,
                    child: getIcon(assets.icError),
                  ),
                ],
              ),
            ),
          );
        }),
        getErrorText(),
      ],
    );
  }

  Widget inputField(hint, textController, readOnly, onChange, onTap) =>
      Expanded(
        child: TextFormField(
          style: textStyles.regularManrope.copyWith(
            color: colors.primaryDark,
            fontSize: sizes.fontRatio * 16,
          ),
          controller: textController,
          onTap: onTap,
          onChanged: (value) {
            if (value.trim().isEmpty) textController.text = value.trim();
            onChange();
          },
          readOnly: readOnly,
          // keyboardType: TextInputType.phone,
          // inputFormatters: <TextInputFormatter>[
          //   FilteringTextInputFormatter.digitsOnly,
          //   LengthLimitingTextInputFormatter(controller.phoneNumMaxLength)
          // ],
          decoration: InputDecoration(
            hintText: hint,
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
        ),
      );

  Widget getIcon(String icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: SvgPicture.asset(icon),
    );
  }

  Widget getErrorText() {
    return GetX<UserDetailsController>(
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
