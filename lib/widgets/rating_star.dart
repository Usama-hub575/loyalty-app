import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class RatingStar extends StatelessWidget {
  final double rating, itemPadding, itemSize;
  final Function onUpdate;
  final Color fillColor, emptyColor, halfFillColor;
  bool fromReviewPage;

  RatingStar(
    this.rating, {
    Key key,
    this.itemPadding = 0,
    this.itemSize = 14,
    this.fillColor,
    this.emptyColor,
    this.halfFillColor,
    this.onUpdate,
    this.fromReviewPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: itemSize,
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: fromReviewPage ? false : true,
      itemCount: 5,
      glow: false,
      ratingWidget: fromReviewPage
          ? RatingWidget(
              full: Icon(
                Icons.star_rounded,
                color: fillColor,
              ),
              empty: Icon(
                Icons.star_border_rounded,
                color: emptyColor,
              ),
            )
          : RatingWidget(
              full: SvgPicture.asset(
                assets.icStar,
                color: fillColor ?? colors.accentPrimary,
              ),
              half: SvgPicture.asset(
                assets.icHalfStar,
                color: halfFillColor ?? colors.accentPrimary,
              ),
              empty: SvgPicture.asset(
                assets.icEmptyStar,
                color: emptyColor ?? colors.accentPrimary,
              ),
            ),
      onRatingUpdate: onUpdate,
      itemPadding: EdgeInsets.symmetric(horizontal: itemPadding),
    );
  }
}
