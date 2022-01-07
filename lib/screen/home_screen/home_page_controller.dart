import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class HomePageController extends GetxController with StateMixin<HomePage> {

  var counter = 0.obs;


  increment() => counter.value++;
}
