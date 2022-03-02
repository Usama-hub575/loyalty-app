import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class SeeAllController extends GetxController
    with StateMixin<SeeAllStoresPage> {
  List<Category> pillsList = [];

  @override
  void onInit() {
    super.onInit();
    pillsList = Get.arguments;
  }

  onBack() {
    Get.back();
  }

  List<String> data = [
    'Grocery',
    'Cloths',
    'Accessories',
    'Grocery',
    'Cloths',
    'Accessories',
    'Grocery',
    'Cloths',
    'Accessories',
    'Grocery',
    'Cloths',
    'Accessories',
  ];

  void onPillsTap(
    index,
  ) {
    if (index == 0 && !pillsList[index].isActive.value) {
      pillsList.forEach((element) {
        element.isActive.value = false;
      });
      pillsList[index].isActive.value = true;
    } else if (index != 0) {
      pillsList[0].isActive.value = false;
      pillsList[index].isActive.value = !pillsList[index].isActive.value;
    }
  }
}
