import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'export.dart';

class SplashPresenterImpl extends SplashController with StateMixin<Splash> {
  SplashPresenterImpl();

  bool isInitialized = false;

  @override
  void initialize({BuildContext context}) async {


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
    // initializeResources(context: context);
  }



  @override
  void openNextRoute({String routeName}) {
    // Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  void navigateToOnBoarding() {
    // updateFirebaseDeviceToken();
    // _presenter.getOnBoardingScenarioType();
  }
}
