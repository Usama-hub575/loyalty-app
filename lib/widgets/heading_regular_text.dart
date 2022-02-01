import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class HeadingRegularText extends StatelessWidget {
  final String title;
  final Color color;
  final double letterSpacing;

  const HeadingRegularText(this.title,
      {Key key, this.color, this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyles.headingRegular.copyWith(
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
