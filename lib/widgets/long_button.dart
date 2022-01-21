import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

Widget LongButton({
  double width = 320.0,
  double height = 55.0,
  bool enable = true,
  borderRadius,
  onPressed,
  text,
}) {
  return Container(
    width: horizontalValue(width),
    height: verticalValue(height),
    decoration: BoxDecoration(
      color: enable ? colors.appColor : colors.grey,
      borderRadius: borderRadius ?? BorderRadius.circular(5),
    ),
    child: ElevatedButton(
      onPressed: enable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Text(
        text,
        style: textStyles.semiBoldManrope
            .copyWith(fontSize: 14, color: colors.white),
      ),
    ),
  );
}
