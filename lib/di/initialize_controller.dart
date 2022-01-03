import 'package:get/get.dart';
import 'package:loyalty/export.dart';

class InitDependencies extends Bindings {
  @override
  void dependencies() {
    Get.put<HomePageController>(HomePageController());
  }
}
