import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class InitDependencies extends Bindings {
  @override
  void dependencies() {
    Get.put<HomePageController>(HomePageController());
  }
}
