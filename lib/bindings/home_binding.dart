import 'package:aactivpay/export.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController(
          Get.find<HomeUseCase>(),
          Get.find(tag: 'register'),
        ));
    // Get.put<Service>(()=> Api());
  }
}
