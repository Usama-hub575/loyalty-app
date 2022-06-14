import 'package:aactivpay/export.dart';

class TransactionController extends GetxController
    with StateMixin<TransactionPage> {
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    Future.delayed(Duration(seconds: 2)).then((value) => {
      change(null, status: RxStatus.success())
    });
  }

  List<Category> pillsList = [
    Category(1, 'all', 0, true.obs),
    Category(2, 'Euro store', 0, false.obs),
    Category(3, 'Emporium', 0, false.obs),
    Category(4, 'Carrefour', 0, false.obs),
    Category(5, 'Euro store', 0, false.obs),
    Category(6, 'Emporium', 0, false.obs),
  ];

  List<Transaction> allTransactions = [
    Transaction('21/01/2022', true, 0, 0),
    Transaction('21/01/2022', false, 20, 550),
    Transaction('21/01/2022', false, 50, 800),
    Transaction('21/01/2022', true, 0, 0),
    Transaction('21/01/2022', false, 20, 550),
    Transaction('21/01/2022', false, 50, 800),
    Transaction('21/01/2022', true, 0, 0),
    Transaction('21/01/2022', false, 20, 550),
    Transaction('21/01/2022', false, 50, 800),
  ];

  onBack() {
    Get.back();
  }

  void onPillsTap(
    index,
  ) {
    pillsList.forEach((element) {
      element.isActive.value = false;
    });
    pillsList[index].isActive.value = true;
  }
}
