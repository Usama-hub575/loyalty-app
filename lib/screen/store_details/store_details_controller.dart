import 'package:aactivpay/export.dart';
import 'package:get/get.dart';

class StoreDetailsController extends GetxController
    with StateMixin<StoreDetailsPage> {
  final StoreDetailsUseCase useCase;

  StoreDetailsController(this.useCase);

  int storeId = -1;
  String storeName = '';

  @override
  Future<void> onInit() async {
    super.onInit();
    storeId = Get.arguments[0];
    storeName = Get.arguments[1];
    change(null, status: RxStatus.loading());
    await useCase.getStoreDetails(storeId).then((value) => {
          if (value.isRight())
            {
              change(null, status: RxStatus.success()),
            }
          else
            {
              change(null, status: RxStatus.error()),
            }
        });
  }

  List<String> categories = ['Grocery', 'Clothing', 'Accosseries'];
  List<Review> reviews = [
    Review(
      name: 'Kristin Watson',
      image: assets.profile1,
      date: '1/2/22',
      comment:
          'Awesome store, and great customer services. Highly recommended ',
      rating: 3.0,
    ),
    Review(
      name: 'Bessie Cooper',
      image: assets.profile2,
      date: '1/2/22',
      comment:
          'Love their drink specials. Bartenders super nice. Spent a week at UCSF and this was a very nice break for the parental unit.',
      rating: 4.0,
    ),
  ];

  List<Transaction> recentTransactions = [
    Transaction('21/01/2022', true, 0, 0),
    Transaction('21/01/2022', false, 20, 550),
    Transaction('21/01/2022', false, 50, 800),
  ];

  void onBack() {
    Get.back();
  }

  void openReviewPage() {
    AppRoutes.appRoutes(RouteNames.reviewScreen);
  }

  void openAllReviewPage() {
    AppRoutes.appRoutes(RouteNames.allReviewsPage, arg: [storeName]);
  }

  Store getData(index) => useCase.data[index].object;
}

class Review {
  final String name, image, comment, date;
  final double rating;

  Review({this.name, this.image, this.date, this.comment, this.rating});
}
