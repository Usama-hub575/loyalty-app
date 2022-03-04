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
            title: controller.storeName,
            onBack: controller.onBack,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Ratings(controller.getData(0)),
                  Reviews(reviews: controller.reviews),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
