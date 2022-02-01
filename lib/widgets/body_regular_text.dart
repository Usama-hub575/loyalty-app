import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class BodyRegularText extends StatelessWidget {
  final String title;
  final Color color;

  const BodyRegularText(this.title, {Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyles.bodyRegular.copyWith(
        color: color,
      ),
    );
  }
}
