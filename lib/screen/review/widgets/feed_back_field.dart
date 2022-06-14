import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class FeedBackField extends StatelessWidget {
  final TextEditingController textController;
  final String hint;
  final Function onTextChange, onTap;

  const FeedBackField(
    this.textController, {
    Key key,
    this.hint = '',
    this.onTextChange,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: horizontalValue(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: inputField(hint, textController, onTextChange, onTap),
    );
  }

  Widget inputField(hint, textController, onChange, onTap) => TextFormField(
        style: textStyles.bodyRegular,
        controller: textController,
        onTap: onTap,
        onChanged: (value) {
          if (value.trim().isEmpty) textController.text = value.trim();
          onChange();
        },
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
      );
}
