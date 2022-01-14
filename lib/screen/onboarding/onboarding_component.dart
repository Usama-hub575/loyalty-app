import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class OnboardingComponents {
  getSkipButton(onSkip) {
    return GestureDetector(
      child: Text(
        'Skip',
        style: textStyles.regularManrope.copyWith(
          fontSize: 14,
        ),
      ),
      onTap: onSkip,
    );
  }

  getNextButton(onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          color: colors.appColorShade,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            'Next',
            style: textStyles.mediumManrope.copyWith(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  getStartedButton(onPressed) {
    return GradientButton(
      text: 'Get Started',
      onPressed: onPressed,
    );
  }

  getIndicators(int page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getCircle(page == 0),
        horizontalSpacer(10),
        getCircle(page == 1),
        horizontalSpacer(10),
        getCircle(page == 2),
      ],
    );
  }

  getCircle(bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: isSelected ? 22 : 10,
      height: 10,
      decoration: BoxDecoration(
          color: isSelected ? colors.appColor : colors.grey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
