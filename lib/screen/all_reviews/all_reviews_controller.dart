import 'package:aactivpay/export.dart';

class AllReviewsController extends GetxController
    with StateMixin<AllReviewsPage> {
  String storeName = '';

  @override
  void onInit() {
    super.onInit();
    storeName = Get.arguments[0];
  }

  onBack() {
    Get.back();
  }

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
    Review(
      name: 'Bessie Cooper',
      image: assets.profile2,
      date: '1/2/22',
      comment:
          'Love their drink specials. Bartenders super nice. Spent a week at UCSF and this was a very nice break for the parental unit.',
      rating: 4.0,
    ),
    Review(
      name: 'Bessie Cooper',
      image: assets.profile2,
      date: '1/2/22',
      comment:
          'Love their drink specials. Bartenders super nice. Spent a week at UCSF and this was a very nice break for the parental unit.',
      rating: 4.0,
    ),
    Review(
      name: 'Bessie Cooper',
      image: assets.profile2,
      date: '1/2/22',
      comment:
          'Love their drink specials. Bartenders super nice. Spent a week at UCSF and this was a very nice break for the parental unit.',
      rating: 4.0,
    ),
    Review(
      name: 'Bessie Cooper',
      image: assets.profile2,
      date: '1/2/22',
      comment:
          'Love their drink specials. Bartenders super nice. Spent a week at UCSF and this was a very nice break for the parental unit.',
      rating: 4.0,
    ),
    Review(
      name: 'Bessie Cooper',
      image: assets.profile2,
      date: '1/2/22',
      comment:
          'Love their drink specials. Bartenders super nice. Spent a week at UCSF and this was a very nice break for the parental unit.',
      rating: 4.0,
    ),
    Review(
      name: 'Bessie Cooper',
      image: assets.profile2,
      date: '1/2/22',
      comment:
          'Love their drink specials. Bartenders super nice. Spent a week at UCSF and this was a very nice break for the parental unit.',
      rating: 4.0,
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

  dynamic getData(int index) {
    if (index == 0) {
      return Store(
        fiveStar: 5,
        fourStar: 3,
        threeStar: 1,
        twoStar: 0,
        oneStar: 0,
        numberOfReviews: 9,
        rating: 3.8,
      );
    } else {
      return reviews;
    }
  }
}
