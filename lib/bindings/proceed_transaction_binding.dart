import 'package:aactivpay/export.dart';

class ProceedTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProceedTransactionController>(() =>
        ProceedTransactionController());
    // Get.put<Service>(()=> Api());
  }
}