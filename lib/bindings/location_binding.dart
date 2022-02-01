import 'package:get/get.dart';
import 'package:aactivpay/screen/export.dart';

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }
}
