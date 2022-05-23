

import 'package:aactivpay/export.dart';

class NotificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    // Get.put<Service>(()=> Api());
  }
}