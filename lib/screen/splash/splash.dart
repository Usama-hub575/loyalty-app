import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/export.dart';

import 'export.dart';

class Splash extends GetView<SplashController> {
  SplashComponents _components = SplashComponents();

  @override
  Widget build(BuildContext context) {
    controller.initialize(context: context);
    return Scaffold(
      backgroundColor: colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: _components.getSplashLogo()),
          SizedBox(height: 30),
          _components.getLoyaltyLogo(),
        ],
      ),
    );
  }
}
