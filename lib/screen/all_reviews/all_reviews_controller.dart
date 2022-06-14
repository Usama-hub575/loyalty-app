import 'package:aactivpay/export.dart';

class AllReviewsController extends GetxController
    with StateMixin<AllReviewsPage> {
  final StoreDetailsUseCase useCase;

  AllReviewsController(this.useCase);

  Store store = Store();


  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    Future.delayed(Duration(seconds: 2))
        .then((value) => {change(null, status: RxStatus.success())});
    store = Get.arguments[0];
    print(store);
  }

  onBack() {
    Get.back();
  }

  getReviews() => useCase.reviews;
}
