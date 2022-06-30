import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadReview extends StatelessWidget {
  final List<BadReviewsModel> badReviews;
  final Function(int) onTap;
  final TextEditingController feedbackController;

  const BadReview(this.badReviews, this.feedbackController,
      {Key key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyLargeText(
          'Oh no ! what went wrong?',
          color: colors.white,
        ),
        verticalSpacer(26),
        Wrap(
          spacing: 10,
          children: List.generate(badReviews.length,
              (index) => getReviewPill(badReviews[index], onTap, index)),
        ),
        verticalSpacer(30),
        FeedBackField(
          feedbackController,
          hint: 'Whats on your mind!',
        ),
      ],
    );
  }

  getReviewPill(BadReviewsModel value, onTap, index) {
    return Obx(
      () => ActionChip(
        onPressed: () => onTap(index),
        padding: EdgeInsets.symmetric(
            horizontal: horizontalValue(10), vertical: verticalValue(6)),
        backgroundColor:
            value.isActive.value ? colors.white : colors.accentPrimary,
        shape: StadiumBorder(side: BorderSide(color: colors.primaryLight)),
        label: BodyExtraSmallText(
          value.title,
          color:
              value.isActive.value ? colors.accentPrimary : colors.primaryLight,
        ),
      ),
    );
  }
}
