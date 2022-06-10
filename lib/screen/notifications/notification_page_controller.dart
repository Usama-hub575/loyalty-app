import 'package:aactivpay/export.dart';

class NotificationsController extends GetxController
    with StateMixin<Notifications> {
  List<String> notificationsList = [
    'You did worth of Rs 5000 shopping at Euro Store',
    'Its approved! enjoy your discount at Euro Store',
    'Upload complete receipt of this transaction to activate your points',
    'Please upload your receipt in order to activate your points for Euro Store',
    'You did worth of Rs 5000 shopping at Euro Store',
  ];

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    Future.delayed(Duration(seconds: 2))
        .then((value) => {change(null, status: RxStatus.success())});
  }

  onBack() {
    Get.back();
  }
}
