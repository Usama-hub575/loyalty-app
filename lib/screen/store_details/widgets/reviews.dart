import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  final List<Review> reviews;
  final seeAll;

  const Reviews({Key key, this.reviews, this.seeAll}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacer(30),
        ...getReviewsList(reviews),
        reviews.length <= 2 ? getSeeAllButton() : SizedBox.shrink(),
      ],
    );
  }

  getReviewsList(List<Review> reviews) {
    return List.generate(
        reviews.length, (index) => getReviewItem(reviews[index]));
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
            onTap: seeAll,
          ),
        ],
      ),
    );
  }
}
