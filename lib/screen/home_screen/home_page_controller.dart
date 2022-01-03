import 'package:get/get.dart';
import 'package:loyalty/export.dart';

class HomePageController extends GetxController with StateMixin<HomePage> {

  var counter = 0.obs;


  increment() => counter.value++;
}
