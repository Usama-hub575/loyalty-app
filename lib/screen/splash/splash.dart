import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

import 'export.dart';

class Splash extends GetView<SplashController> {
  SplashComponents _components = SplashComponents();
  final di = GetInstance();

  @override
  Widget build(BuildContext context) {
    controller.initialize(context: context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [colors.appColor.withOpacity(0.5), colors.appColor]),
      ),
      child: Scaffold(
        backgroundColor: colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: verticalValue(260),
                width: horizontalValue(170),
                child: _components.getSplashLogo(),
              ),
            ),
            verticalSpacer(22),
            _components.getAactivpayLogo(),
          ],
        ),
      ),
    );
  }
}
