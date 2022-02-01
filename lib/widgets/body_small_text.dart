import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class BodySmallText extends StatelessWidget {
  final String title;
  final Color color;

  const BodySmallText(this.title, {Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyles.bodySmall.copyWith(
        color: color ,
      ),
    );
  }
}
