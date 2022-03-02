import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController with StateMixin<ReviewScreen> {
  Rx<bool> badRating = false.obs;
  Rx<bool> goodRating = false.obs;
  Rx<bool> supperGoodRating = false.obs;
  double rating = 0;
  TextEditingController feedBackController;

  List<BadReviewsModel> badReviews = [
    BadReviewsModel('Prices are very high as compared to others', false.obs),
    BadReviewsModel('Didn’t give me the discount', false.obs),
    BadReviewsModel('Expired products', false.obs),
    BadReviewsModel('The app is hard to use', false.obs),
  ];

  void onBack() {
    Get.back();
  }

  void openFeedBackPage() {
    Get.off(FeedBackPage());
  }

  void setRating(value) {
    rating = value;
    updatePageState();
  }

  void onPillTap(int index) {
    badReviews[index].isActive.value = !badReviews[index].isActive.value;
  }

  void updatePageState() {
    if (rating > 4) {
      supperGoodRating.value = true;
      goodRating.value = false;
      badRating.value = false;
    } else if (rating <= 4 && rating > 3) {
      supperGoodRating.value = false;
      goodRating.value = true;
      badRating.value = false;
    } else {
      supperGoodRating.value = false;
      goodRating.value = false;
      badRating.value = true;
    }
  }
}

class BadReviewsModel {
  final String title;
  Rx<bool> isActive;

  BadReviewsModel(this.title, this.isActive);
}
