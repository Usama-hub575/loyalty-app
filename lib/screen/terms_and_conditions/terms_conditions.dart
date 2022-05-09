import 'package:aactivpay/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends GetView<TermsAndConditionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryLight,
      body: Container(
        height: sizes.height,
        width: sizes.width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            verticalSpacer(20),
            AppBarWidget(
              title: 'Terms & Condition',
              onBack: controller.onBack,
            ),
            verticalSpacer(10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingRegularText(constants.termOfUse,
                        color: colors.accentPrimary),
                    verticalSpacer(10),
                    BodySmallText(constants.termOfUseDescription),
                    verticalSpacer(20),
                    HeadingRegularText(constants.privacyPolicy,
                        color: colors.accentPrimary),
                    verticalSpacer(10),
                    BodySmallText(constants.privacyPolicyDescription),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
