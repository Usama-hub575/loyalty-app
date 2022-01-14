import 'package:domain/export.dart';
import 'package:get/get.dart';
import 'package:aactivpay/screen/export.dart';

class PhoneAuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneAuthController>(
        () => PhoneAuthController(Get.find<AuthUseCase>()));
  }
}
