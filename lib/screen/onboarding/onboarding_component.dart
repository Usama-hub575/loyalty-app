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

  getHeadingText(int page){
    return Text('Discovered the undoubtable source');
  }
  getDetailsText(int page){
    return Text('Simply dummy text of the printing and typ esetting industry. Lorem Ipsum has been the industry');
  }

  getSkipButton(int page){
    return Text('skip');

  }
  getNextButton(int page){
    return Text('next');

  }
  getStartedButton(int page){
    return Text('get started');

  }
}
