import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends GetView<UserDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          shader(top: -30, left: -30),
          shader(bottom: -30, right: -30),
          SingleChildScrollView(
            child: Container(
              height: sizes.height,
              padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(40),
                  controller.component.getTitle(),
                  verticalSpacer(20),
                  controller.component.getDetailText(),
                  verticalSpacer(25),
                  controller.component.getProfileImage(),
                  verticalSpacer(10),
                  controller.component.getUploadPhotoText(),
                  verticalSpacer(30),
                  controller.component.getTextField(
                    'User Name',
                    assets.icUser,
                    controller.userNameController.value,
                    controller.onTextChange,
                  ),
                  verticalSpacer(10),
                  controller.component.getTextField(
                    'Info @example.com',
                    assets.icEmail,
                    controller.emailController.value,
                    controller.onTextChange,
                  ),
                  verticalSpacer(10),
                  controller.component.getTextField(
                    'Area / Location',
                    assets.icLocation,
                    controller.addressController.value,
                    controller.onTextChange,
                    readOnly: true,
                    onTap: controller.openLocationPage,
                  ),
                  Spacer(),
                  Obx(
                    () => LongButton(
                      enable: controller.isEnable.value,
                      text: 'Continue',
                      onPressed: controller.onContinue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
