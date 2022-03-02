import 'package:aactivpay/export.dart';

class AllTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
