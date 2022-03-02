import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class SplashController extends GetxController with StateMixin<Splash> {
  final SharedPreferences _preferences;
  final AuthUseCase _authUseCase;

  SplashController(this._preferences, this._authUseCase);

  bool isInitialized = false;

  void initialize({BuildContext context}) async {
    if (!isInitialized) {
      final di = GetInstance();
      print('in splash onInit');
      initAppResources(context);
      Future.delayed(Duration(seconds: 3), () => openNextRoute());
    }

    // await _initializerUseCase.getInitRoute().then(
    //   (routeName) {
    //     if (routeName == AppRoutes.tabs) {
    //       executeOnBoarding(routeName);
    //     } else {
    //       view.openNextRoute(routeName: routeName);
    //     }
    //   },
    // );
  }

  void initAppResources(BuildContext context) {
    if (!isInitialized) {
      isInitialized = true;
      initializeResources(context: context);
    }
  }

  void openNextRoute() {
    if (!_preferences.containsKey(constants.isFirstTime)) {
      _preferences.setDouble(constants.lat, 0.0);
      _preferences.setDouble(constants.lng, 0.0);
      navigateToOnBoarding();
    } else
      _authUseCase.getRoute(
        navigateToLogin,
        navigateToRegister,
        navigateToHome,
      );
  }
}

void navigateToOnBoarding() {
  // updateFirebaseDeviceToken();
  AppRoutes.appRoutes(RouteNames.onboardingScreen);
}

void navigateToHome() {
  // updateFirebaseDeviceToken();
  AppRoutes.appRoutes(RouteNames.homeScreen);
}

void navigateToRegister(number) {
  // updateFirebaseDeviceToken();
  AppRoutes.appRoutes(RouteNames.registerScreen, arg: [
    constants.registration,
    number,
    constants.register,
  ]);
}

void navigateToLogin() {
  // updateFirebaseDeviceToken();
  AppRoutes.appRoutes(RouteNames.phoneLoginScreen);
}
