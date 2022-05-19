import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class OnboardingController extends GetxController
    with StateMixin<OnboardingPage> {
  final SharedPreferences _preferences;

  OnboardingController(this._preferences);

  var currentPage = 0.obs;
  PageController pageController;
  Rx<String> title = constants.onBoardingTitle1.obs;
  Rx<String> subTitle = constants.onBoardingSubTitle1.obs;
  Rx<String> buttonTitle = constants.continueText.obs;

  final pageChildren = RxList<Widget>([]);

  void initialize() {
    pageController = PageController();
    addPages();
  }

  void addPages() {
    pageChildren.add(OnboardingItem(
      ValueKey('page1'),
      image: assets.onboarding1,
    ));
    pageChildren.add(OnboardingItem(
      ValueKey('page2'),
      image: assets.onboarding2,
    ));
    pageChildren.add(OnboardingItem(
      ValueKey('page3'),
      image: assets.onboarding3,
    ));
  }

  updatePage() {
    if (currentPage.value == 2)
      navigateToLoginPage();
    else {
      currentPage.value++;
      if (currentPage.value == 1) {
        title.value = constants.onBoardingTitle2;
        subTitle.value = constants.onBoardingSubTitle2;
        buttonTitle.value = constants.continueText;
      } else if (currentPage.value == 2) {
        title.value = constants.onBoardingTitle3;
        subTitle.value = constants.onBoardingSubTitle3;
        buttonTitle.value = constants.getStarted;
      }
    }
  }

  navigateToLoginPage() {
    _preferences.setBool(constants.isFirstTime, false);
    AppRoutes.appRoutes(RouteNames.phoneLoginScreen);
  }
}
