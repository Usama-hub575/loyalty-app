import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends GetView<ReviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.accentPrimary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: sizes.height,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReviewAppBar(
                'How is it going so far?',
                onCross: controller.onBack,
              ),
              verticalSpacer(30),
              BodyRegularText(
                'Help us to improve the quality by telling us about your experience',
                color: colors.white,
              ),
              verticalSpacer(50),
              RatingStar(
                controller.rating,
                itemSize: 24,
                fillColor: colors.tieYellow,
                halfFillColor: colors.tieYellow,
                emptyColor: colors.white,
                itemPadding: 1,
                onUpdate: (rating) => controller.setRating(rating),
              ),
              verticalSpacer(20),
              Obx(
                    () =>
                controller.badRating.value
                    ? BadReview(
                  controller.badReviews,
                  controller.feedBackController,
                  onTap: controller.onPillTap,
                )
                    : SizedBox.shrink(),
              ),
              Obx(
                    () =>
                controller.goodRating.value
                    ? GoodReview(
                  'Good',
                  'Nice to know',
                  controller.feedBackController,
                )
                    : SizedBox.shrink(),
              ),
              Obx(
                    () =>
                controller.supperGoodRating.value
                    ? GoodReview(
                  'Excellent!',
                  'We are as thrilled as you are',
                  controller.feedBackController,
                )
                    : SizedBox.shrink(),
              ),
              Spacer(),
              Obx(
                    () =>
                !controller.badRating.value &&
                    !controller.goodRating.value &&
                    !controller.supperGoodRating.value
                    ? LongButton(
                  'Skip',
                  backgroundColor: colors.transparent,
                  textColor: colors.primaryLight,
                  borderColor: colors.white,
                  onPressed: controller.onBack,
                )
                    : controller.goodRating.value ||
                    controller.supperGoodRating.value
                    ? LongButton(
                  'Invite a friend',
                  backgroundColor: colors.white,
                  textColor: colors.accentPrimary,
                )
                    : SizedBox.shrink(),
              ),
              verticalSpacer(10),
              Obx(
                    () =>
                !controller.goodRating.value &&
                    !controller.supperGoodRating.value
                    ? LongButton(
                  'Submit',
                  backgroundColor: colors.primaryLight,
                  textColor: colors.accentPrimary,
                  onPressed: controller.openFeedBackPage,
                  enable: controller.badRating.value ||
                      controller.goodRating.value ||
                      controller.supperGoodRating.value,
                )
                    : LongButton(
                  'Maybe,later',
                  backgroundColor: colors.transparent,
                  textColor: colors.primaryLight,
                  borderColor: colors.white,
                  onPressed: controller.openFeedBackPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
