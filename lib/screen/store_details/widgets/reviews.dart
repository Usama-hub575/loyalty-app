import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Reviews extends StatelessWidget {
  final List<Review> reviews;
  final bool showSeeAllButton;
  final seeAll;

  const Reviews(
      {Key key, this.reviews, this.showSeeAllButton = false, this.seeAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacer(30),
        ...getReviewsList(reviews),
        showSeeAllButton && reviews.length > 2
            ? getSeeAllButton()
            : SizedBox.shrink(),
      ],
    );
  }

  getReviewsList(List<Review> reviews) {
    return List.generate(
      showSeeAllButton && reviews.length >= 2 ? 2 : reviews.length,
      (index) => getReviewItem(reviews[index]),
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
                // backgroundImage: NetworkImage(review.reviewerImageUrl),
                child: Image.network(
                  review.reviewerImageUrl ?? '',
                  errorBuilder: (context, _, error) {
                    return SvgPicture.asset(
                      assets.icProfile,
                    );
                  },
                ),
              ),
              horizontalSpacer(10),
              BodyRegularText(review.reviewerName ?? ''),
            ],
          ),
          verticalSpacer(12),
          Row(
            children: [
              RatingStar(review.rating.toDouble()),
              horizontalSpacer(10),
              // BodyRegularText(review.date),
            ],
          ),
          verticalSpacer(20),
          Row(
            children: [
              Container(
                width: sizes.width * 0.88,
                child: BodyRegularText(
                  review.content,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getSeeAllButton() {
    return Container(
      width: sizes.width,
      color: colors.primaryLight,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
