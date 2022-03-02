import 'dart:async';

import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:circular_countdown/circular_countdown.dart';

var timeValue = 0.0.obs;

void modalBottomSheet(context, state) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      constraints: BoxConstraints.tight(
        Size(sizes.width, sizes.height * 0.72),
      ),
      backgroundColor: colors.transparent,
      builder: (BuildContext context) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: HorizontalDivider(
                //     width: 60.0,
                //     height: 2.0,
                //     color: colors.primaryDark,
                //     borderRadius: 2.0,
                //   ),
                // ),
                verticalSpacer(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getTitle(),
                    Spacer(),
                    getTimer(),
                  ],
                ),
                verticalSpacer(16),
                getDescription(),
                verticalSpacer(20),
                getQrCode(),
                gatInviteCodeBox(),
                Spacer(),
                getCopyButton(null),
              ],
            ));
      });
}

Widget getQrCode() {
  return Container(
    height: sizes.heightRatio * 170,
    width: sizes.width,
    child: Stack(
      children: [
        Center(
          child: SvgPicture.asset(
            assets.icQrBorder,
            height: 180,
            width: 180,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            assets.icQR,
            color: colors.primaryDark,
            height: 130,
            width: 130,
          ),
        ),
      ],
    ),
  );
}

Widget getTitle() {
  return Text(
    'AactivePay Code',
    style: textStyles.headingRegular,
  );
}

Widget getTimer() {
  return Obx(
    () => CircularCountdown(
      strokeWidth: 3,
      countdownCurrentColor: colors.error,
      countdownTotal: 60,
      countdownRemaining: 60 - timeValue.value.toInt(),
      countdownRemainingColor: colors.transparent,
      diameter: 30,
      countdownTotalColor: colors.error,
      gapFactor: 200,
      textStyle: textStyles.bodyExtraSmall,
    ),
  );
}

Widget getDescription() {
  return Text(
    'Share this QR code (or 6 letter code) with salesman in order to get discount. This code will auto refresh after every 45 minutes',
    style: textStyles.bodyExtraSmall,
  );
}

Widget getCopyButton(onPressed) {
  return LongButton(
    'Done',
    onPressed: () => Get.back(),
  );
}

Widget gatInviteCodeBox() {
  return Container(
    width: sizes.width,
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: colors.primaryLight,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            '5A3F83C',
            style: textStyles.headingLarge
                .copyWith(letterSpacing: 8, fontWeight: FontWeight.w800),
          ),
        ),
        verticalSpacer(8),
        Text(
          'Tap to copy to clipboard',
          style: textStyles.bodyExtraSmall,
        ),
      ],
    ),
  );
}
