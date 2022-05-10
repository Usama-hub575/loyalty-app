import 'package:aactivpay/export.dart';

class SeeAllBranchesController extends GetxController
    with StateMixin<SeeAllBranchesPage> {


  List<String> allBranchesList = [
    'Plaza number 118, Dha ph#1, Lahore',
    'Plaza number 118, Dha ph#1, Lahore',
    'Plaza number 118, Dha ph#1, Lahore',
    'Plaza number 118, Dha ph#1, Lahore',
    'Plaza number 118, Dha ph#1, Lahore',
  ];


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onBack() {
    Get.back();
  }
}
