import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/export.dart';

import 'export.dart';

class Splash extends GetView<SplashController> {
  SplashComponents _components = SplashComponents();

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return Scaffold(
      backgroundColor: colors.appColor,
      body: Center(child: _components.getLabsterLogo()),
    );
  }
}
