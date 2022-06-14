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
        padding: EdgeInsets.symmetric(horizontal: horizontalValue(20),),
        child: Column(
          children: [
            verticalSpacer(40),
            Padding(
              padding:  EdgeInsets.only(bottom: verticalValue(10)),
              child: AppBarWidget(
                title: 'Terms & Condition',
                onBack: controller.onBack,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacer(30),
                    HeadingRegularText(constants.termOfUse,
                        color: colors.accentPrimary),
                    verticalSpacer(10),
                    BodySmallText(constants.termOfUseDescription),
                    verticalSpacer(12),
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
