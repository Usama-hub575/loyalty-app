import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/export.dart';

import 'export.dart';

class AppRoutes {
  static List<GetPage> getPage = [
    GetPage(
      name: RouteNames.splash,
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteNames.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteNames.onboarding,
      page: () => OnboardingPage(),
      binding: OnboardingBinding(),
    ),
  ];

  static Route<dynamic> appRoutes(final String name) {
    switch (name) {
      case RouteNames.splash:
        return Get.to(Splash(), binding: SplashBinding()) as Route<dynamic>;
      case RouteNames.onboarding:
        return Get.to(OnboardingPage(), binding: OnboardingBinding())
            as Route<dynamic>;
      case RouteNames.home:
        return Get.to(HomePage(), binding: HomeBinding()) as Route<dynamic>;
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return Get.to(Container()) as Route<dynamic>;
  }
}
