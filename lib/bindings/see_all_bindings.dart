import 'package:get/get.dart';
import 'package:aactivpay/screen/export.dart';

class SeeAllBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeAllController>(() => SeeAllController());
  }
}
