import 'package:aactivpay/export.dart';

class SeeAllCategoriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeAllCategoriesController>(() =>
        SeeAllCategoriesController());
    // Get.put<Service>(()=> Api());
  }
}