import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconButton extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final Function onTap;

  const AppIconButton(
    this.icon, {
    Key key,
    this.iconColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset(
        icon,
        color: iconColor,
      ),
      onTap: onTap,
    );
  }
}
