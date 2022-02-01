import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class BodyExtraSmallText extends StatelessWidget {
  final String title;
  final Color color;

  const BodyExtraSmallText(this.title, {Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyles.bodyExtraSmall.copyWith(
        color: color,
      ),
    );
  }
}
