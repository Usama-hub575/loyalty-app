import 'package:aactivpay/export.dart';
import 'package:get/get.dart';

class ReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewController>(() => ReviewController());
  }
}
