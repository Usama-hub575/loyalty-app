import 'package:aactivpay/export.dart';
import 'package:get/get.dart';

class StoreDetailsController extends GetxController
    with StateMixin<StoreDetailsPage> {
  final StoreDetailsUseCase useCase;

  StoreDetailsController(this.useCase);

  int storeId = -1;
  String storeName = '';

  @override
  Future<void> onInit() async {
    super.onInit();
    storeId = Get.arguments[0];
    storeName = Get.arguments[1];
    change(null, status: RxStatus.loading());
    await useCase.getStoreDetails(storeId).then((value) => {
          if (value.isRight())
            {
              change(null, status: RxStatus.success()),
            }
          else
            {
              change(null, status: RxStatus.error()),
            }
        });
  }


  List<Transaction> recentTransactions = [
    Transaction('21/01/2022', true, 0, 0),
    Transaction('21/01/2022', false, 20, 550),
    Transaction('21/01/2022', false, 50, 800),
  ];

  void onBack() {
    Get.back();
  }

  void openReviewPage(int branchId) {
    AppRoutes.appRoutes(RouteNames.reviewScreen, arg: [storeId, branchId]);
  }

  void openAllReviewPage() {
    AppRoutes.appRoutes(RouteNames.allReviewsPage, arg: [getData(0)]);
  }

  getData(index) => useCase.data[index].object;
}
