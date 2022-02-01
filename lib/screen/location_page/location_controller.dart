import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationController extends GetxController with StateMixin<LocationPage> {
  LocationComponents components = LocationComponents();
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;

  onBack() {
    Get.back();
  }
}
