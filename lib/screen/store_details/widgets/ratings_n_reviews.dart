import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingAndReviews extends StatelessWidget {
  final List<Review> reviews;

  const RatingAndReviews({Key key, this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacer(20),
        Row(
          children: [
            horizontalSpacer(20),
            HeadingRegularText('Rating and reviews'),
          ],
        ),
        verticalSpacer(16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            horizontalSpacer(20),
            getRating(),
            Spacer(),
            getRatingBars(),
            horizontalSpacer(30),
          ],
        ),
        verticalSpacer(30),
        getReviewsList(reviews),
        getSeeAllButton(),
      ],
    );
  }

  getRating() {
    return Column(
      children: [
        Text(
          '4.0',
          style: textStyles.headingRegular
              .copyWith(fontSize: 45, fontWeight: FontWeight.w500),
        ),
        RatingStar(4.0),
        BodySmallText('12,593,122'),
      ],
    );
  }

  getRatingBars() {
    return Column(
      children: [
        ratingBarItem(5, 20),
        verticalSpacer(6),
        ratingBarItem(4, 120),
        verticalSpacer(6),
        ratingBarItem(3, 100),
        verticalSpacer(6),
        ratingBarItem(2, 120),
        verticalSpacer(6),
        ratingBarItem(1, 140),
      ],
    );
  }

  ratingBarItem(index, int rating) {
    return Row(
      children: [
        Text(
          index.toString(),
          style: textStyles.headingRegular.copyWith(fontSize: 12),
        ),
        horizontalSpacer(6),
        Container(
          width: sizes.width * 0.46,
          height: 10,
          padding: EdgeInsets.only(right: rating.toDouble()),
          decoration: BoxDecoration(
            color: colors.primaryDark.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            width: sizes.width * 0.46,
            decoration: BoxDecoration(
              color: colors.accentPrimary,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }

  getReviewsList(List<Review> reviews) {
    return Column(
      children: [
        getReviewItem(reviews[0]),
        getReviewItem(reviews[1]),
      ],
    );
  }

  getReviewItem(Review review) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.white,
        border: Border(
          top: BorderSide(
            color: colors.primaryDark.withOpacity(0.02),
            width: 2,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(review.image),
              ),
              horizontalSpacer(10),
              BodyRegularText(review.name),
            ],
          ),
          verticalSpacer(12),
          Row(
            children: [
              RatingStar(review.rating),
              horizontalSpacer(10),
              BodyRegularText(review.date),
            ],
          ),
          verticalSpacer(20),
          BodyRegularText(review.comment),
        ],
      ),
    );
  }

  getSeeAllButton() {
    return Container(
      width: sizes.width,
      color: colors.primaryLight,
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Row(
        children: [
          BodySmallText(
            'See all reviews',
            color: colors.accentPrimary,
          ),
          Spacer(),
          AppIconButton(
            assets.icRightArrow,
            iconColor: colors.accentPrimary,
          ),
        ],
      ),
    );
  }
}
