import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryLight,
      body: Stack(
        children: [
          controller.component.getTopBackGround(),
          Container(
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: horizontalValue(20.0), vertical: 20),
            child: Column(
              children: [
                verticalSpacer(30),
                controller.component.getAppBar(controller.onBack),
                verticalSpacer(80),
                controller.component.getStatsBox(),
                verticalSpacer(30),
                controller.component
                    .getSettingItem('assets', 'Edit Profile'),
                verticalSpacer(20),
                controller.component
                    .getSettingItem(assets, 'How to use'),
                verticalSpacer(20),
                controller.component.getSettingItem(
                    assets, 'Transaction History'),
                verticalSpacer(20),
                controller.component
                    .getSettingItem(assets, 'Invite friend'),
                verticalSpacer(20),
                controller.component
                    .getSettingItem(assets, 'About app'),
                verticalSpacer(20),
                controller.component
                    .getSettingItem(assets, 'Terms & Conditions'),
                verticalSpacer(20),
                controller.component
                    .getSettingItem(assets, 'Support & Live chat'),
              ],
            ),
          ),
          Positioned(
            top: 130,
            child: controller.component.getProfileImage(assets.profile),
          ),
        ],
      ),
    );
  }
}
