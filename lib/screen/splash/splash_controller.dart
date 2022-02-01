import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';


class SplashController extends GetxController with StateMixin<Splash> {
  bool isInitialized = false;

  void initialize({BuildContext context}) async {
    initAppResources(context);
    Future.delayed(Duration(seconds: 3), () => navigateToOnBoarding());
    // await _initializerUseCase.getInitRoute().then(
    //   (routeName) {
    //     _performance.endTrace(PerformanceKeys.splashPageLoad);
    //     if (routeName == AppRoutes.tabs) {
    //       executeOnBoarding(routeName);
    //     } else {
    //       view.openNextRoute(routeName: routeName);
    //     }
    //   },
    // );

    // pushNotificationUseCase.initialize(context);
  }

  void initAppResources(BuildContext context) {
    if (isInitialized) {
      return;
    }

    isInitialized = true;
    initializeResources(context: context);
  }

  void openNextRoute({String routeName}) {
    // Navigator.pushReplacementNamed(context, routeName);
  }

  void navigateToOnBoarding() {
    // updateFirebaseDeviceToken();

    AppRoutes.appRoutes(RouteNames.onboardingScreen);
  }
}
