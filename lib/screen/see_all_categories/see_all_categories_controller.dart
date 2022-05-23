import 'package:aactivpay/export.dart';

class SeeAllCategoriesController extends GetxController
    with StateMixin<SeeAllCategories> {
  List<int> categoriesIds=[];
  List<Category> pillsList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pillsList = Get.arguments[0];
    categoriesIds = Get.arguments[1];
  }




  void onPillsTap(
    index,
  ) {
    if (index == 0 && !pillsList[index].isActive.value) {
      categoriesIds.clear();
      pillsList.forEach((element) {
        element.isActive.value = false;
      });
      pillsList[index].isActive.value = true;
    } else if (index != 0) {
      pillsList[0].isActive.value = false;
      pillsList[index].isActive.value = !pillsList[index].isActive.value;

      if (categoriesIds.contains(pillsList[index].categoryId)) {
        categoriesIds.remove(pillsList[index].categoryId);
        print(categoriesIds);
      } else {
        categoriesIds.add(pillsList[index].categoryId);
      }
      print(categoriesIds);
    }
  }

  onBack() {
    Get.back();
  }

   onApply() {
    Get.back(result: categoriesIds);
  }
}
