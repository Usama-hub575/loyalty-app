import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LocationComponents {
  Widget getBackButton(onBack) {
    return GestureDetector(
      onTap: onBack,
      child: getIcon(
        assets.icBack,
      ),
    );
  }

  Widget getMapImage() {
    return Image.asset(
      assets.map,
      width: sizes.width,
    );
  }

  Widget getSemiBoldText(text, size, color) {
    return Text(
      text,
      style: textStyles.bodyExtraSmall.copyWith(
        fontSize: sizes.fontRatio * size,
        color: color,
      ),
    );
  }

  Widget getContinueButton(onPressed) {
    return LongButton(
       'Select',
      onPressed: onPressed,
    );
  }

  Widget getSearchField() {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 18),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: colors.primaryLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          getIcon(assets.icSearch),
          horizontalSpacer(20),
          inputField(),
        ],
      ),
    );
  }

  Widget inputField() => Expanded(
        child: GetX<LocationController>(builder: (controller) {
          return TextFormField(
            autofocus: false,
            style: textStyles.bodyRegular.copyWith(
              color: colors.primaryDark,
              fontSize: sizes.fontRatio * 16,
            ),
            controller: controller.phoneNumberController.value,
            decoration: InputDecoration(
              hintText: 'Search Location',
              hintStyle: textStyles.bodyRegular.copyWith(
                color: colors.primaryDark.withOpacity(0.05),
                fontSize: sizes.fontRatio * 14,
              ),
              focusColor: colors.accentPrimary,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          );
        }),
      );

  Widget getIcon(String icon) {
    return SvgPicture.asset(icon);
  }

  getCurrentLocationField() {
    return Container(
      width: sizes.width,
      height: sizes.heightRatio * 56,
      color: colors.primaryLight,
      child: Row(
        children: [
          horizontalSpacer(18),
          Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.only(
              left: 5,
              bottom: 9,
              right: 7,
              top: 10,
            ),
            decoration: BoxDecoration(
              gradient: colors.linearGradient,
              shape: BoxShape.circle,
            ),
            // child: getIcon(assets.icCurrentLocation),
          ),
          horizontalSpacer(20),
          getSemiBoldText('Use my Current Location', 14, colors.primaryDark),
        ],
      ),
    );
  }
}
