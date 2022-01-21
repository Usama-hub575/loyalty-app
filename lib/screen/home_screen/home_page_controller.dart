import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class HomePageController extends GetxController
    with SingleGetTickerProviderMixin, StateMixin<HomePage> {
  HomePageComponents components = HomePageComponents();
  Rx<TextEditingController> searchController = TextEditingController().obs;
  final pageChildren = RxList<Widget>([]);
  var currentPage = 0.obs;
  var strokeWidth = 10.0.obs;
  PageController pageController;
  Animation animation;
  AnimationController _animationController;

  List<ScrollingPills> pillsList = [
    ScrollingPills('Grocery', true.obs),
    ScrollingPills('Cloths', false.obs),
    ScrollingPills('Accessories', false.obs),
    ScrollingPills('Grocery', false.obs),
    ScrollingPills('Cloths', false.obs),
    ScrollingPills('Accessories', false.obs),
  ];

  @override
  void onInit() {
    super.onInit();
    _animationController =
        AnimationController(vsync: this, duration: Duration(minutes: 2));
    _animationController.repeat(reverse: true);

    animation = Tween(begin: 0.0, end: 15.0).animate(_animationController);
    pageController = PageController(initialPage: 0, viewportFraction: 1.1);
    pageChildren.addAll([
      FullWidthCard(),
      FullWidthCard(),
      FullWidthCard(),
      FullWidthCard(),
      FullWidthCard(),
      FullWidthCard(),
    ]);
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
    AppRoutes.appRoutes(RouteNames.seeAll);
  }

  void onPillsTap(index) {
    pillsList.forEach((element) {
      element.isActive.value = false;
    });
    pillsList[index].isActive.value = true;
  }
}

class ScrollingPills {
  String title;
  Rx<bool> isActive;

  ScrollingPills(this.title, this.isActive);
}
