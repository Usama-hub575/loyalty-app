import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class HomePageController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin<HomePage> {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  var currentPage = 0.obs;
  var strokeWidth = 10.0.obs;

  List<ScrollingPills> pillsList1 = [
    ScrollingPills('Electronics', false.obs),
    ScrollingPills('Dairy & eggs', false.obs),
    ScrollingPills('Health & beauty', false.obs),
    ScrollingPills('Frozen', false.obs),
    ScrollingPills('Cosmetics', false.obs),
    ScrollingPills('Grocery', true.obs),
    ScrollingPills('Cloths', false.obs),
    ScrollingPills('Meat', false.obs),
    ScrollingPills('Frozen', false.obs),
    ScrollingPills('Stationery & gifts', false.obs),
    ScrollingPills('Cosmetics', false.obs),
    ScrollingPills('Stationery & gifts', false.obs),
  ];
  List<ScrollingPills> pillsList2 = [
    ScrollingPills('Cloths', false.obs),
    ScrollingPills('Grocery', true.obs),
    ScrollingPills('Electronics', false.obs),
    ScrollingPills('Meat', false.obs),
    ScrollingPills('Stationery & gifts', false.obs),
    ScrollingPills('Frozen', false.obs),
    ScrollingPills('Cosmetics', false.obs),
    ScrollingPills('Stationery & gifts', false.obs),
    ScrollingPills('Health & beauty', false.obs),
    ScrollingPills('Dairy & eggs', false.obs),
    ScrollingPills('Cosmetics', false.obs),
    ScrollingPills('Frozen', false.obs),
  ];
  List<ScrollingPills> pillsList3 = [
    ScrollingPills('Frozen', false.obs),
    ScrollingPills('Cosmetics', false.obs),
    ScrollingPills('Stationery & gifts', false.obs),
    ScrollingPills('Stationery & gifts', false.obs),
    ScrollingPills('Grocery', true.obs),
    ScrollingPills('Cloths', false.obs),
    ScrollingPills('Electronics', false.obs),
    ScrollingPills('Meat', false.obs),
    ScrollingPills('Health & beauty', false.obs),
    ScrollingPills('Dairy & eggs', false.obs),
    ScrollingPills('Frozen', false.obs),
    ScrollingPills('Cosmetics', false.obs),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void updatePage({int index}) {
    currentPage.value = index;
  }

  void openBottomSheet(BuildContext context, scaffoldState) {
    modalBottomSheet(
      context,
    );
  }

  void openSeeAllPage() {
    AppRoutes.appRoutes(RouteNames.seeAllScreen);
  }

  void openSettingsPage() {
    AppRoutes.appRoutes(RouteNames.settingsScreen);
  }

  void openSearchPage() {
    AppRoutes.appRoutes(RouteNames.searchScreen);
  }

  void onPillsTap(index, list) {
    if (list == 1)
      pillsList1[index].isActive.value = !pillsList1[index].isActive.value;
    else if (list == 2)
      pillsList2[index].isActive.value = !pillsList2[index].isActive.value;
    else
      pillsList3[index].isActive.value = !pillsList3[index].isActive.value;
  }
}

class ScrollingPills {
  String title;
  Rx<bool> isActive;

  ScrollingPills(this.title, this.isActive);
}
