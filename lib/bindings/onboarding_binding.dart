import 'package:aactivpay/export.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController(Get.find(tag: 'sp')));
  }
}
