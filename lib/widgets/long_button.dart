import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton(this.text,
      {Key key,
      this.width,
      this.height = 50.0,
      this.borderRadius,
      this.enable = true,
      this.isLoading = false,
      this.backgroundColor,
      this.borderColor = Colors.transparent,
      this.textColor,
      this.onPressed})
      : super(key: key);

  final double width, height, borderRadius;
  final bool enable, isLoading;
  final Color backgroundColor, borderColor, textColor;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: horizontalValue(width ?? sizes.width),
      height: verticalValue(height),
      decoration: BoxDecoration(
        color: enable
            ? backgroundColor ?? colors.accentPrimary
            : colors.primaryDark.withOpacity(0.05),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: ElevatedButton(
        onPressed: enable ? onPressed : null,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: isLoading && enable
            ? Container(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: colors.white,
                ),
              )
            : Text(
                text,
                style: textStyles.bodyLarge
                    .copyWith(color: textColor ?? colors.primaryLight),
              ),
      ),
    );
  }
}
