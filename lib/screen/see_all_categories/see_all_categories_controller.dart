import 'package:aactivpay/export.dart';

class SeeAllCategoriesController extends GetxController
    with StateMixin<SeeAllCategories> {
  List<Category> pillsList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pillsList = Get.arguments;
  }

  getAllCategories() {
    StoreCategories data;
    var pillIndex;
  }

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

  onBack() {
    Get.back();
  }
}
