import 'package:get/get.dart';
import 'package:aactivpay/screen/export.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
    // Get.put<Service>(()=> Api());
  }
}
