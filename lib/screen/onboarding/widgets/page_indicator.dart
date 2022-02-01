import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int page;

  const PageIndicator(this.page, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getCircle(page == 0),
        horizontalSpacer(16),
        getCircle(page == 1),
        horizontalSpacer(16),
        getCircle(page == 2),
      ],
    );
  }

  getCircle(bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color:
              isSelected ? colors.white : colors.primaryDark.withOpacity(0.2),
          shape: BoxShape.circle),
      width: 12,
      height: 12,
    );
  }
}
