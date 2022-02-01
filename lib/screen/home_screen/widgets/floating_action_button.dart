import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FloatingAction extends StatelessWidget {
  final onPressed;
  const FloatingAction({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.accentPrimary,
          boxShadow: [
            BoxShadow(
              color: colors.accentPrimary.withOpacity(0.2),
              spreadRadius: 6,
            )
          ],
        ),
        child: SvgPicture.asset(assets.icQR),
      ),
    );
  }
}
