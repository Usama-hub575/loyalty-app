import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.accentPrimary,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReviewAppBar(
              'FeedBack',
              onCross: onBack,
            ),
            HeadingLargeText(
              'thank you for you’r valueable feedback ! our support team will look into the issues.',
              color: colors.white,
            ),
            LongButton(
              'Continue',
              backgroundColor: colors.white,
              textColor: colors.primaryDark,
              onPressed: onBack,
            ),
          ],
        ),
      ),
    );
  }

  onBack() {
    Get.back();
  }
}
