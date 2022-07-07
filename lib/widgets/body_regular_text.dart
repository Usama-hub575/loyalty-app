import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class BodyRegularText extends StatelessWidget {
  final String title;
  final Color color;
  final TextAlign textAlign;

  const BodyRegularText(this.title, {Key key, this.color, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: textStyles.bodyRegular.copyWith(
        color: color,
      ),
      maxLines: 3,
    );
  }
}
