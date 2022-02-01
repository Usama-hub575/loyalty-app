import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void modalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: colors.transparent,
      constraints: BoxConstraints(
        minHeight: 0.0,
        maxHeight: sizes.height * 0.65,
      ),
      builder: (BuildContext context) {
        return Container(
            height: sizes.height * 0.65,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: colors.primaryLight,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: HorizontalDivider(
                    width: 60.0,
                    height: 2.0,
                    color: colors.primaryDark,
                    borderRadius: 2.0,
                  ),
                ),
                verticalSpacer(40),
                getTitle(),
                verticalSpacer(16),
                getDescription(),
                verticalSpacer(20),
                getQrCode(),
                verticalSpacer(16),
                getCode(),
                Spacer(),
                getCopyButton(null),
              ],
            ));
      });
}

Widget getCode() {
  return Center(
    child: Text(
      '5A3F83C',
      style: textStyles.headingLarge.copyWith(letterSpacing: 2),
    ),
  );
}

Widget getQrCode() {
  return Center(
    child: SvgPicture.asset(
      assets.icQR,
      color: colors.primaryDark,
      height: 100,
      width: 100,
    ),
    // child: GetX<HomePageController>(builder: (controller) {
    //   return CircularProgressIndicator(
    //     value: controller.animation.value,
    //     strokeWidth: controller.strokeWidth.value,
    //   );
    // }),
  );
}

Widget getTitle() {
  return Text(
    'Radeem Discounts',
    style: textStyles.bodyLarge,
  );
}

Widget getDescription() {
  return Text(
    'Share this QR code (or 6 letter code) with salesman in order to get discount. This code will auto refresh after every 45 minutes',
    style: textStyles.bodyRegular,
  );
}

Widget getCopyButton(onPressed) {
  return LongButton(
    'Copy to clipboard',
    onPressed: onPressed,
  );
}
