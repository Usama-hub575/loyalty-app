import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class SearchController extends GetxController with StateMixin<SearchPage> {
  TextEditingController searchController = TextEditingController();

  Rx<bool> isCross = false.obs;

  List<String> recentSearch = [
    'Abdullah store',
    'Euro Store',
    'Al Fateh',
    'Asad Store',
  ];

  @override
  void onInit() {
    super.onInit();
  }

  onBack() {
    Get.back();
  }

  onTextChange(String text) {
    isCross.value = text.isNotEmpty;
  }

  onTextClear() {
    searchController.text = '';
    isCross.value = false;
  }
}
