import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class AppRoutes {
  static List<GetPage> getPage = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteNames.homeScreen,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteNames.onboardingScreen,
      page: () => OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: RouteNames.loginScreen,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteNames.phoneLoginScreen,
      page: () => PhoneAuthScreen(),
      binding: PhoneAuthBinding(),
    ),
    GetPage(
      name: RouteNames.otpScreen,
      page: () => OTPVerificationScreen(),
      binding: OTPBinding(),
    ),
    GetPage(
      name: RouteNames.registerScreen,
      page: () => RegisterScreen(),
      binding: UserDetailsBinding(),
    ),
    GetPage(
      name: RouteNames.locationScreen,
      page: () => LocationPage(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: RouteNames.seeAllScreen,
      page: () => SeeAllPage(),
      binding: SeeAllBinding(),
    ),
    GetPage(
      name: RouteNames.searchScreen,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: RouteNames.editProfileScreen,
      page: () => EditProfilePage(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: RouteNames.settingsScreen,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
  ];

  static Future<dynamic> appRoutes(final String routeName) {
    switch (routeName) {
      //push to next
      case RouteNames.splashScreen:
      case RouteNames.otpScreen:
      case RouteNames.registerScreen:
      case RouteNames.locationScreen:
      case RouteNames.seeAllScreen:
      case RouteNames.searchScreen:
      case RouteNames.editProfileScreen:
      case RouteNames.settingsScreen:
        return Get.toNamed(routeName);

        //clear all and push
      case RouteNames.onboardingScreen:
      case RouteNames.loginScreen:
      case RouteNames.phoneLoginScreen:
      case RouteNames.homeScreen:
        return Get.offAllNamed(routeName);

      default:
        return _errorRoute();
    }
  }

  static Future<dynamic> _errorRoute() {
    return Get.to(Container());
  }
}
