import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class SeeAllController extends GetxController with StateMixin {
  SeeAllComponents components = SeeAllComponents();

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
}
