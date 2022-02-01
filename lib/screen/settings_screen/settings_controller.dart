import 'package:aactivpay/export.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController with StateMixin<SettingsPage> {
  SettingsComponent component = SettingsComponent();

  onBack() {
    Get.back();
  }
}
