import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty/export.dart';

class OnboardingComponents {
  getOnboardingImage(int page) {
    switch (page) {
      case 0:
        return SvgPicture.asset(
          assets.icOnboarding1,
          width: sizes.width * 0.65,
          fit: BoxFit.fitWidth,
        );
      case 1:
        return SvgPicture.asset(
          assets.icOnboarding2,
          width: sizes.width * 0.65,
          fit: BoxFit.fitWidth,
        );
      case 2:
        return SvgPicture.asset(
          assets.icOnboarding1,
          width: sizes.width * 0.65,
          fit: BoxFit.fitWidth,
        );
    }
  }

  getHeadingText(int page) {
    switch (page) {
      case 0:
        return Text(
          'Discovered the undoubtable source',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        );
      case 1:
        return Text(
          'Discovered the undoubtable source',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        );
      case 2:
        return Text(
          'Discovered the undoubtable source',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        );
    }
  }

  getDetailsText(int page) {
    switch (page) {
      case 0:
        return Text(
          'Simply dummy text of the printing and typ esetting industry. Lorem Ipsum has been the industry',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        );
      case 1:
        return Text(
          'Simply dummy text of the printing and typ esetting industry. Lorem Ipsum has been the industry',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        );
      case 2:
        return Text(
          'Simply dummy text of the printing and typ esetting industry. Lorem Ipsum has been the industry',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        );
    }
  }

  getSkipButton(int page, onSkip) {
    return TextButton(
      child: Text(
        page < 2 ? 'Skip' : '',
        style: TextStyle(
          fontSize: 16,
          color: colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      onPressed: page < 2 ? onSkip : null,
    );
  }

  getNextButton(int page, onPressed) {
    return ElevatedButton(
      child: Text(
        page < 2 ? 'Next' : 'Get Started',
        style: TextStyle(
          fontSize: 30,
          color: colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: colors.black,
        fixedSize: Size(sizes.widthRatio * 250, sizes.heightRatio * 50),
      ),
      onPressed: onPressed,
    );
  }

  getIndicators(int page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getCircle(page == 0),
        SizedBox(width: 20),
        getCircle(page == 1),
        SizedBox(width: 20),
        getCircle(page == 2),
      ],
    );
  }

  getCircle(bool isBold) {
    return Container(
      width: isBold ? 14 : 10,
      height: isBold ? 14 : 10,
      decoration: BoxDecoration(
        color: colors.appColor,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
