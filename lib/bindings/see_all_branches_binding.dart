


import 'package:aactivpay/export.dart';

class SeeAllBranchesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeAllBranchesController>(() => SeeAllBranchesController());
    // Get.put<Service>(()=> Api());
  }
}