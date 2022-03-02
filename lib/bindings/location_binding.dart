import 'package:aactivpay/export.dart';

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(
        () => LocationController(Get.find<LocationUseCase>()));
  }
}
