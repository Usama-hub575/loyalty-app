import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class SearchController extends GetxController with StateMixin<SearchPage> {
  TextEditingController searchController = TextEditingController();

  Rx<bool> isCross = false.obs;

  var recentSearch = List.empty(growable: true).obs;

  @override
  void onInit() {
    populateRecentSearch();
    super.onInit();
  }

  onBack() {
    Get.back();
  }

  removeStoreFromRecentSearch(int index) {
    recentSearch.removeAt(index);
  }

  onTextChange(String text) {
    isCross.value = text.isNotEmpty;
  }

  onTextClear() {
    searchController.text = '';
    isCross.value = false;
  }

  void populateRecentSearch() {
    recentSearch.addAll([
      'Abdullah store',
      'Euro Store',
      'Al Fateh',
      'Asad Store',
    ]);
  }
}
