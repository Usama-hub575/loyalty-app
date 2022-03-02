import 'package:aactivpay/export.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        Get.find(tag: 'sp'),
        Get.find<AuthUseCase>(),
      ),
    );
  }
}
