import 'package:aactivpay/export.dart';

class SeeAllBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeAllController>(() => SeeAllController(Get.find<AllStoresUseCase>()));
  }
}
