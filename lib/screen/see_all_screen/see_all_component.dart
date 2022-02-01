import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SeeAllComponents {
  Widget getAppBar(onBack) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getBackButton(onBack),
        getCenterTitle(),
        horizontalSpacer(24),
      ],
    );
  }

  Widget getBackButton(onBack) {
    return GestureDetector(
      onTap: onBack,
      child: SvgPicture.asset(
        assets.icBack,
      ),
    );
  }

  Widget getCenterTitle() {
    return Text(
      'Popular Stores',
      style: textStyles.bodyLarge,
    );
  }
}
