import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

Widget horizontalDivider({
  width = double.infinity,
  height = 1.0,
  color = Colors.grey,
  borderRadius = 0,
}) =>
    Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
