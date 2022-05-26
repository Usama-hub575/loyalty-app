import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class AllReviewsPage extends GetView<AllReviewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryLight,
      body: Column(
        children: [
          verticalSpacer(40),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: horizontalValue(20.0)),
            child: AppBarWidget(
              title: controller.store.name,
              onBack: controller.onBack,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Ratings(controller.store),
                  Reviews(reviews: controller.getReviews()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
