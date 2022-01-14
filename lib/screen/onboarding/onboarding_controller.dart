import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class OnboardingController extends GetxController with StateMixin<Splash> {
  var currentPage = 0.obs;
  PageController pageController;
  OnboardingComponents components;
  final pageChildren = RxList<Widget>([]);

  void initialize() {
    pageController = PageController();
    components = OnboardingComponents();
    addPages();
  }

  void addPages() {
    pageChildren.add(OnboardingItem(
      ValueKey('page1'),
      image: assets.onboarding1,
      title: 'Purchase',
      description:
          'Pickup the groceries and wearable items from your nearby store and get the best discounts',
    ));
    pageChildren.add(OnboardingItem(
      ValueKey('page2'),
      image: assets.onboarding2,
      title: 'QR Code',
      description:
          'Show your QR to the salesman and collect points for get discounts from the same store',
    ));
    pageChildren.add(OnboardingItem(
      ValueKey('page3'),
      image: assets.onboarding3,
      title: 'Discount',
      description:
          'Scan your QR code the fast way to Radeem your available points',
    ));
  }

  updatePage({int value}) {
    if (value == null) {
      currentPage.value++;
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    } else {
      currentPage.value = value;
    }
    if (currentPage.value >= 3) navigateToLoginPage();
  }

  onSkip() {
    navigateToLoginPage();
  }

  navigateToLoginPage() {
    AppRoutes.appRoutes(RouteNames.phoneLogin);
  }
}
