

import 'package:aactivpay/export.dart';
import 'package:flutter/cupertino.dart';

class VerticalStapper extends StatelessWidget{
  String text;

  VerticalStapper(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.primaryDark.withOpacity(0.05),
          ),
        ),
        horizontalSpacer(20),
        BodyRegularText(text,color: colors.primaryDark.withOpacity(0.05),)
      ],
    );
    // throw UnimplementedError();
  }


}