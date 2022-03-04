import 'dart:async';

import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class HomePageController extends GetxController with StateMixin<HomePage> {
  final HomeUseCase useCase;

  HomePageController(this.useCase);

  Rx<TextEditingController> searchController = TextEditingController().obs;
  var currentPage = 0.obs;
  var strokeWidth = 10.0.obs;

  Rx<LocationModel> userAddress = LocationModel().obs;
  List<Category> pillsList = [];

  List<Transaction> recentTransactions = [
    Transaction('21/01/2022', true, 0, 0),
    Transaction('21/01/2022', false, 20, 550),
    Transaction('21/01/2022', false, 50, 800),
  ];

  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    StoreCategories data;
    var pillsIndex;
    await useCase.getHomeData().then(
        (value) => {
              if (value.isRight())
                {
                  if (useCase.data.isNotEmpty)
                    {
                      pillsIndex = useCase.data.indexWhere(
                          (element) => element.type == HomeDataType.CATEGORIES),
                      data = useCase.getData()[pillsIndex].data,
                      pillsList = data?.categoryList,
                      userAddress.value = useCase.userAddress,
                      change(null, status: RxStatus.success())
                    }
                  else
                    change(null, status: RxStatus.empty()),
                },
            }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

    downloadData();
  }

  set setPillsData(data) => pillsList = data;

  set address(address) => userAddress.value = address;

  getHomeData(index) => useCase.data[index].data;

  void updatePage({int index}) {
    currentPage.value = index;
  }

  void openBottomSheet(BuildContext context, scaffoldState) {
    modalBottomSheet(
      context,
      scaffoldState,
    );
  }

  void openSettingsPage() {
    AppRoutes.appRoutes(RouteNames.settingsScreen);
  }

  void openSearchPage() {
    AppRoutes.appRoutes(RouteNames.searchScreen);
  }

  Future<void> openLocationPage() async {
    LocationModel location =
        await AppRoutes.appRoutes(RouteNames.locationScreen);
    if (location.geoAddress.isNotEmpty) {
      address = location;
    }
  }

  void openProfilePage() {
    AppRoutes.appRoutes(RouteNames.registerScreen, arg: [
      constants.profile,
      '',
      constants.update,
    ]);
  }

  void openStoreDetailsPage(int storeId, String storeName) {
    AppRoutes.appRoutes(RouteNames.storeDetailsScreen,
        arg: [storeId, storeName]);
  }

  void openAllStorePage() {
    AppRoutes.appRoutes(RouteNames.seeAllStore, arg: pillsList);
  }

  void openAllTransactionPage() {
    AppRoutes.appRoutes(RouteNames.seeAllTransaction);
  }

  void onPillsTap(
    index,
  ) {
    if (index == 0 && !pillsList[index].isActive.value) {
      pillsList.forEach((element) {
        element.isActive.value = false;
      });
      pillsList[index].isActive.value = true;
    } else if (index != 0) {
      pillsList[0].isActive.value = false;
      pillsList[index].isActive.value = !pillsList[index].isActive.value;
    }
  }

  void downloadData() {
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (timeValue.value >= 59) {
        timeValue.value = 0;
      } else {
        timeValue.value = timeValue.value + 1;
        print(timeValue.value);
      }
    });
  }
}

class ScrollingPills {
  String title;
  Rx<bool> isActive;

  ScrollingPills(this.title, this.isActive);
}

class Transaction {
  final String date;
  final bool isPending;
  final double earnedPoints;
  final double amount;

  Transaction(
    this.date,
    this.isPending,
    this.earnedPoints,
    this.amount,
  );
}
