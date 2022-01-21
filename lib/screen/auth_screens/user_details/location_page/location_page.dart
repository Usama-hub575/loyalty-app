import 'dart:ffi';

import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationPage extends GetView<LocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: sizes.height,
              color: colors.background,
              child: Column(
                children: [
                  controller.components.getMapImage(),
                  verticalSpacer(20),
                  controller.components
                      .getSemiBoldText('Add New Address', 20, colors.appColor),
                  verticalSpacer(20),
                  controller.components.getSearchField(),
                  verticalSpacer(20),
                  controller.components.getCurrentLocationField(),
                  Spacer(),
                  controller.components.getContinueButton(null),
                  verticalSpacer(20),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: controller.components.getBackButton(controller.onBack),
          ),
        ],
      ),
    );
  }
}
