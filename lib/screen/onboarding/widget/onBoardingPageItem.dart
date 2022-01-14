import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  OnboardingItem(Key key, {this.title, this.description, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          getOnboardingImage(image),
          getHeadingText(title),
          verticalSpacer(20),
          getDetailsText(description)
        ],
      ),
    );
  }

  getOnboardingImage(image) {
    return Image.asset(
      image,
      width: sizes.width * 0.90,
    );
  }

  getHeadingText(String title) {
    return Text(
      title,
      style: textStyles.boldGradientMontserrat.copyWith(
        fontSize: 36,
      ),
    );
  }
}

getDetailsText(String description) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40),
    child: Text(
      description,
      style: textStyles.regularManrope.copyWith(
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
