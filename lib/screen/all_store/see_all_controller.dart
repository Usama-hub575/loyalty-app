import 'package:aactivpay/export.dart';

class SeeAllController extends GetxController
    with StateMixin<SeeAllStoresPage> {
  final AllStoresUseCase allStoresUseCase;

  SeeAllController(this.allStoresUseCase);

  List<Category> pillsList = [];

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    allStoresUseCase.getAllStores().then(
        (value) => {
              value.fold(
                (l) {
                  showToast(message: l.title);
                  change(null, status: RxStatus.error());
                  return false;
                },
                (r) {
                  if (allStoresUseCase.data.isNotEmpty) {
                    change(null, status: RxStatus.success());
                  } else {
                    change(null, status: RxStatus.empty());
                  }
                  return true;
                },
              )
            }, onError: (error) {
      showToast(message: error.title);
      change(null, status: RxStatus.error());
    });
    pillsList = Get.arguments;
  }

  onBack() {
    Get.back();
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

  void onStoreTap(int storeId, String storeName) {
    AppRoutes.appRoutes(RouteNames.storeDetailsScreen,
        arg: [storeId, storeName]);
  }
}
