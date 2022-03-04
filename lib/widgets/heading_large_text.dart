import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class HeadingLargeText extends StatelessWidget {
  final String title;
  final Color color;
  final double letterSpacing;
  final TextOverflow overflow;

  const HeadingLargeText(
    this.title, {
    Key key,
    this.color,
    this.letterSpacing,
    this.overflow = TextOverflow.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: textStyles.headingLarge.copyWith(
        color: color,
        letterSpacing: letterSpacing,
        overflow: overflow,
      ),
    );
  }
}
