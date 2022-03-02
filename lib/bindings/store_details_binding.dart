import 'package:get/get.dart';
import 'package:aactivpay/screen/export.dart';

class StoreDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreDetailsController>(() => StoreDetailsController());
  }
}
