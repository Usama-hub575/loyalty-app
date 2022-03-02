import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class RatingStar extends StatelessWidget {
  final double rating, itemPadding, itemSize;
  final Function onUpdate;
  final Color fillColor, emptyColor, halfFillColor;

  const RatingStar(
    this.rating, {
    Key key,
    this.itemPadding = 0,
    this.itemSize = 14,
    this.fillColor,
    this.emptyColor,
    this.halfFillColor,
    this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: itemSize,
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      glow: false,
      itemCount: 5,
      ratingWidget: RatingWidget(
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
