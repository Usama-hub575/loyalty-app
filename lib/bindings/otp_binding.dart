import 'package:domain/export.dart';
import 'package:get/get.dart';
import 'package:aactivpay/screen/export.dart';

class OTPBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPVerificationController>(
        () => OTPVerificationController(Get.find<AuthUseCase>()));
  }
}
