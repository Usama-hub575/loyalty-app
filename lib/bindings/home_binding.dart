import 'package:get/get.dart';
import 'package:loyality/screen/export.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
    // Get.put<Service>(()=> Api());
  }
}
