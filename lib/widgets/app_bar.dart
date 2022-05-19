import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget {
  final title;
  final onBack;

  const AppBarWidget({Key key, this.title = '', this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getBackButton(onBack),
        HeadingRegularText(
          title,
        ),
        SizedBox(width: 20),
      ],
    );
  }

  Widget getBackButton(onBack) {
    return AppIconButton(
      assets.icBack,
      onTap: onBack,
    );
  }
}
