import 'package:aactivpay/export.dart';

class PhoneAuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneAuthController>(
      () => PhoneAuthController(
        Get.find<AuthUseCase>(),
        Get.find(tag: 'sp'),
      ),
    );
  }
}
