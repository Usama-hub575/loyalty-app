import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class BodyExtraSmallText extends StatelessWidget {
  final String title;
  final Color color;
  final double size;

  const BodyExtraSmallText(this.title, {Key key, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyles.bodyExtraSmall.copyWith(
        color: color,
        fontSize: size,
      ),
    );
  }
}
