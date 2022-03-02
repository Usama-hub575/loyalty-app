import 'package:aactivpay/export.dart';

class SearchAddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchAddressController>(() => SearchAddressController());
  }
}
