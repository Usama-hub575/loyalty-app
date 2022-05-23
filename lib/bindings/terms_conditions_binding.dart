import 'package:aactivpay/screen/export.dart';
import 'package:get/get.dart';


class TermsAndConditionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsAndConditionsController>(() => TermsAndConditionsController());
    // Get.put<Service>(()=> Api());
  }
}
