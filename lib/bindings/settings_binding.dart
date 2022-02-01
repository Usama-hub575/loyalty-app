import 'package:get/get.dart';
import 'package:aactivpay/screen/export.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
    // Get.put<Service>(()=> Api());
  }
}
