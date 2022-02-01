import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hint, suffixIcon;
  final Function onTextChange, onTap;
  final bool readOnly;

  const RegisterTextField(
    this.textController, {
    Key key,
    this.hint = '',
    this.suffixIcon,
    this.onTextChange,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isFocused = false.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetX<RegisterController>(builder: (controller) {
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
                  color: isFocused.value
                      ? readOnly
                          ? colors.primaryDark.withOpacity(0.05)
                          : colors.accentPrimary
                      : colors.primaryDark.withOpacity(0.05),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  inputField(
                      hint, textController, readOnly, onTextChange, onTap),
                  suffixIcon != null ? getIcon(suffixIcon) : SizedBox.shrink(),
                ],
              ),
            ),
          );
        }),
        // getErrorText(),
      ],
    );
  }

  Widget inputField(hint, textController, readOnly, onChange, onTap) =>
      Expanded(
        child: TextFormField(
          style: textStyles.bodyRegular,
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
            hintStyle: textStyles.bodyRegular.copyWith(
              color: colors.primaryDark.withOpacity(0.5),
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
    return SvgPicture.asset(icon);
  }
}
