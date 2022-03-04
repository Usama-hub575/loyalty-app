import 'package:aactivpay/export.dart';

class StoreDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreDetailsController>(
      () => StoreDetailsController(
        Get.find<StoreDetailsUseCase>(),
      ),
    );
  }
}
