import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SplashController extends GetxController {
  void initAppResources(BuildContext context);
  void openNextRoute({String routeName});

  void navigateToOnBoarding();
}
