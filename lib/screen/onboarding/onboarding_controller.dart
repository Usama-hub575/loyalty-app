import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class OnboardingController extends GetxController with StateMixin<Splash> {
  var page = 0.obs;

  void initialize({BuildContext context}) {
    // TODO: implement initialize
  }

  void onNext() {
    if (page.value < 2)
      page.value++;
    else
      navigateToLoginPage();
  }

  void onSkip() {
    navigateToLoginPage();
  }

  navigateToLoginPage() {
    AppRoutes.appRoutes(RouteNames.login);
  }
}
