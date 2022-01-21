import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

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
    GetPage(
      name: RouteNames.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteNames.phoneLogin,
      page: () => PhoneAuthScreen(),
      binding: PhoneAuthBinding(),
    ),
    GetPage(
      name: RouteNames.otpScreen,
      page: () => OTPVerificationScreen(),
      binding: OTPBinding(),
    ),
    GetPage(
      name: RouteNames.userDetailsScreen,
      page: () => UserDetailsScreen(),
      binding: UserDetailsBinding(),
    ),
    GetPage(
      name: RouteNames.locationScreen,
      page: () => LocationPage(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: RouteNames.seeAll,
      page: () => SeeAllPage(),
      binding: SeeAllBinding(),
    ),
  ];

  static Future<dynamic> appRoutes(final String routeName) {
    switch (routeName) {
      case RouteNames.splash:
      case RouteNames.otpScreen:
      case RouteNames.locationScreen:
      case RouteNames.seeAll:
        return Get.toNamed(routeName);
      case RouteNames.onboarding:
      case RouteNames.login:
      case RouteNames.phoneLogin:
      case RouteNames.userDetailsScreen:
      case RouteNames.home:
        return Get.offAllNamed(routeName);
      default:
        return _errorRoute();
    }
  }

  static Future<dynamic> _errorRoute() {
    return Get.to(Container());
  }
}
