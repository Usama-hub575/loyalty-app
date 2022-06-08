import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  final Store data;

  const Ratings(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacer(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: HeadingRegularText('Rating and reviews'),
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
      ],
    );
  }

  getRating() {
    return Column(
      children: [
        Text(
          data.rating.toString(),
          style: textStyles.headingRegular
              .copyWith(fontSize: 45, fontWeight: FontWeight.w500),
        ),
        RatingStar(
          data.rating,
          emptyColor: colors.primaryDark,
        ),
        BodySmallText(data.numberOfReviews.toString()),
      ],
    );
  }

  getRatingBars() {
    return Column(
      children: [
        ratingBarItem(5, data.fiveStar),
        verticalSpacer(6),
        ratingBarItem(4, data.fourStar),
        verticalSpacer(6),
        ratingBarItem(3, data.threeStar),
        verticalSpacer(6),
        ratingBarItem(2, data.twoStar),
        verticalSpacer(6),
        ratingBarItem(1, data.oneStar),
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
          child: ProgressBar(
            max: data.numberOfReviews > 0
                ? data.numberOfReviews.toDouble()
                : 10.0,
            current: rating.toDouble(),
            color: colors.accentPrimary,
          ),
        )
        // Container(
        //     width: sizes.width * 0.46,
        //     height: 10,
        //     // padding: EdgeInsets.all(10),
        //     decoration: BoxDecoration(
        //       color: colors.primaryDark.withOpacity(0.1),
        //       borderRadius: BorderRadius.circular(100),
        //     ),
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.all(Radius.circular(10)),
        //       child: LinearProgressIndicator(
        //         value: 0.1,
        //         color: colors.accentPrimary,
        //         backgroundColor: colors.primaryDark.withOpacity(0.1),
        //       ),
        //     )),
      ],
    );
  }
}
