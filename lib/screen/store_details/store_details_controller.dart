import 'package:aactivpay/export.dart';
import 'package:get/get.dart';

class StoreDetailsController extends GetxController
    with StateMixin<StoreDetailsPage> {
  @override
  void onInit() {
    super.onInit();
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
}

class Review {
  final String name, image, comment, date;
  final double rating;

  Review({this.name, this.image, this.date, this.comment, this.rating});
}
