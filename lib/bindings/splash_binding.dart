import 'package:get/get.dart';
import 'package:aactivpay/screen/export.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
