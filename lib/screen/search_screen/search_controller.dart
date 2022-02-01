import 'package:get/get.dart';

import 'export.dart';

class SearchController extends GetxController with StateMixin<SearchPage> {
  SearchComponent component = SearchComponent();

  onBack() {
    Get.back();
  }
}
