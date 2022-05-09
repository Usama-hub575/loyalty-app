import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';



class AppRoutes {
  final arg;

  AppRoutes({this.arg});

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
      name: RouteNames.searchAddressScreen,
      page: () => SearchAddressPage(),
      binding: SearchAddressBinding(),
    ),
    GetPage(
      name: RouteNames.seeAllStore,
      page: () => SeeAllStoresPage(),
      binding: SeeAllBinding(),
    ),
    GetPage(
      name: RouteNames.seeAllTransaction,
      page: () => TransactionPage(),
      binding: AllTransactionBinding(),
    ),
    GetPage(
      name: RouteNames.searchScreen,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: RouteNames.settingsScreen,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: RouteNames.storeDetailsScreen,
      page: () => StoreDetailsPage(),
      binding: StoreDetailsBinding(),
    ),
    GetPage(
      name: RouteNames.reviewScreen,
      page: () => ReviewScreen(),
      binding: ReviewBinding(),
    ),
    GetPage(
      name: RouteNames.allReviewsPage,
      page: () => AllReviewsPage(),
      binding: AllReviewBinding(),
    ),
    GetPage(
      name: RouteNames.termsAndConditionsPage,
      page: () => TermsAndConditions(),
      binding: TermsAndConditionBinding(),
    ),
  ];

  static Future<dynamic> appRoutes(final String routeName, {arg}) {
    switch (routeName) {
      //push to next
      case RouteNames.splashScreen:
      case RouteNames.otpScreen:
      case RouteNames.registerScreen:
      case RouteNames.locationScreen:
      case RouteNames.searchAddressScreen:
      case RouteNames.seeAllStore:
      case RouteNames.searchScreen:
      case RouteNames.editProfileScreen:
      case RouteNames.settingsScreen:
      case RouteNames.storeDetailsScreen:
      case RouteNames.reviewScreen:
      case RouteNames.seeAllTransaction:
      case RouteNames.allReviewsPage:
      case RouteNames.termsAndConditionsPage:
        return Get.toNamed(routeName, arguments: arg);

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
