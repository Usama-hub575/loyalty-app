import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchComponent {
  getAppBar({onBack}) {
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

  getCenterTitle() {
    return Text(
      'Search',
      style: textStyles.bodyRegular.copyWith(
        color: colors.primaryLight,
      ),
    );
  }

  getBackGroundImage() {
    return Image.asset(
      assets.searchBG,
    );
  }

  getTopGradient() {
    return Container(
      height: sizes.heightRatio * 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: <Color>[
            colors.accentPrimary.withOpacity(0.7),
            colors.accentPrimary.withOpacity(0.4),
            colors.accentPrimary.withOpacity(0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
    );
  }
}
