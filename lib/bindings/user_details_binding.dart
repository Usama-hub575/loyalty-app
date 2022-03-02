import 'package:aactivpay/export.dart';

class UserDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController(
        Get.find<RegisterUseCase>(tag: 'register'), Get.find(tag: 'sp')));
  }
}
