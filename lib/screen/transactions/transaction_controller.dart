import 'package:aactivpay/export.dart';

class TransactionController extends GetxController
    with StateMixin<TransactionPage> {
  @override
  void onInit() {
    super.onInit();
  }

  List<Category> pillsList = [
    Category(1, 'all', true.obs),
    Category(2, 'Euro store', false.obs),
    Category(3, 'Emporium', false.obs),
    Category(4, 'Carrefour', false.obs),
    Category(5, 'Euro store', false.obs),
    Category(6, 'Emporium', false.obs),
    Category(7, 'Carrefour', false.obs),
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
