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
    if (userNameController.value.text.isNotEmpty &&
        emailController.value.text.isNotEmpty) {
      isEnable.value = true;
    } else
      isEnable.value = false;
  }

  onContinue() {}

  openLocationPage() {
    AppRoutes.appRoutes(RouteNames.locationScreen);
  }
}
