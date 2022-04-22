import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class AllReviewsPage extends GetView<AllReviewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryLight,
      body: Column(
        children: [
          verticalSpacer(30),
          AppBarWidget(
            title: controller.store.name,
            onBack: controller.onBack,
          ),
          Expanded(
            child: SingleChildScrollView(
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
