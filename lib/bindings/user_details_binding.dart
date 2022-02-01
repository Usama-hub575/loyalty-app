import 'package:get/get.dart';
import 'package:aactivpay/screen/export.dart';

class UserDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
