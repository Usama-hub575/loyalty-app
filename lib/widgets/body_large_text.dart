import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class BodyLargeText extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;

  const BodyLargeText(this.title, {Key key, this.color, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyles.bodyLarge.copyWith(
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
