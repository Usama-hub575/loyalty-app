import 'package:aactivpay/export.dart';
import 'package:get/get.dart';

class AllReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllReviewsController>(() => AllReviewsController());
  }
}