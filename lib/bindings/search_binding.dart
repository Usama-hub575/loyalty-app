import 'package:get/get.dart';
import 'package:aactivpay/screen/export.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
    // Get.put<Service>(()=> Api());
  }
}
