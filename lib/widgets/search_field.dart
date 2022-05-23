import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchField extends StatelessWidget {
  final String hint;
  final onBack;
  final onTap;
  final onTextChange;
  final onClear;
  final isReadOnly;
  final isCross;
  final TextEditingController controller;

  SearchField(
    this.controller, {
    Key key,
    this.hint,
    this.onBack,
    this.onTap,
    this.onTextChange,
    this.onClear,
    this.isReadOnly = false,
    this.isCross = false,
  }) : super(key: key);

  var isFocused = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Focus(
          onFocusChange: (focus) {
            isFocused.value = focus;
            print('isFocus: $focus');
          },
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: (isFocused.value || isCross) && !isReadOnly
                        ? colors.accentPrimary
                        : colors.white,
                    width: 2.0,
                  ),
                )),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: AppIconButton(
                    assets.icBack,
                    onTap: onBack,
                  ),
                ),
                horizontalSpacer(16),
                inputField(controller),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: AppIconButton(
                    isCross ? assets.icCross : assets.icSearch,
                    onTap: onClear,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget inputField(controller) => Expanded(
        child: TextFormField(
          onTap: onTap,
          autofocus: false,
          readOnly: isReadOnly,
          style: textStyles.bodyRegular,
          controller: controller,
          onChanged: (value) => onTextChange(value),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textStyles.bodyRegular.copyWith(
              color: colors.primaryDark.withOpacity(0.5),
            ),
            focusColor: colors.accentPrimary,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      );
}
