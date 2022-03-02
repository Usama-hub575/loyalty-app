import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class Splash extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    controller.initialize(context: context);
    return Scaffold(
      backgroundColor: colors.primaryLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assets.icAactivpay,
              width: sizes.width * 0.8,
            ),
            verticalSpacer(10),
            Text(
              constants.discountIsYourRight,
              style: textStyles.bodyRegular,
            ),
          ],
        ),
      ),
    );
  }
}
