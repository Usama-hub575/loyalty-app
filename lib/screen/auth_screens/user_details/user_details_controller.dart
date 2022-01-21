import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsController extends GetxController
    with StateMixin<UserDetailsScreen> {
  UserDetailsComponent component = UserDetailsComponent();
  Rx<bool> isError = false.obs;
  Rx<bool> isEnable = false.obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;

  onTextChange() {
    if (userNameController.value.text.trim().isNotEmpty &&
        emailController.value.text.trim().isNotEmpty) {
      isEnable.value = true;
    } else
      isEnable.value = false;
  }

  onContinue() {
    AppRoutes.appRoutes(RouteNames.home);
  }

  openLocationPage() {
    AppRoutes.appRoutes(RouteNames.locationScreen);
  }
}
