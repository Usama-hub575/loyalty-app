import 'package:aactivpay/export.dart';

class AllReviewsController extends GetxController
    with StateMixin<AllReviewsPage> {
  final StoreDetailsUseCase useCase;

  AllReviewsController(this.useCase);

  Store store = Store();


  @override
  void onInit() {
    super.onInit();
    store = Get.arguments[0];
    print(store);
  }

  onBack() {
    Get.back();
  }

  getReviews() => useCase.reviews;
}
