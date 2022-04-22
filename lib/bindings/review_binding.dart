import 'package:aactivpay/export.dart';

class ReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewController>(() => ReviewController(Get.find<ReviewUseCase>()));
  }
}
