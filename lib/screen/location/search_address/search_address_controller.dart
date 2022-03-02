import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class SearchAddressController extends GetxController
    with StateMixin<SearchAddressPage> {
  TextEditingController searchController = TextEditingController();
  Rx<bool> isCross = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  onBack() {
    Get.back(result: '');
  }

  onClear() {
    searchController.text = '';
    isCross.value = false;
  }

  onTextChange(String text) {
    isCross.value = text.isNotEmpty;
  }

  onSelect() {
    Get.back(result: searchController.value.text);
  }
}
