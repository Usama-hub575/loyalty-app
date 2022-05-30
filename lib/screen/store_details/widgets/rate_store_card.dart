import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class RateStore extends StatelessWidget {
  final Function onTap;
  final Store store;

  const RateStore({Key key, this.store, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(store.nearestBranch.branchId),
      child: Container(
        width: sizes.width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors.white,
          border: Border(
            bottom: BorderSide(
              color: colors.primaryDark.withOpacity(0.02),
              width: 2,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingRegularText('Rate this store'),
            BodyRegularText(
              'Tell others what you think',
              color: colors.primaryDark.withOpacity(0.6),
            ),
            verticalSpacer(20),
            RatingStar(
              0,
              itemPadding: 15,
              itemSize: 24,
              emptyColor: colors.primaryDark,
            ),
            verticalSpacer(20),
            BodyLargeText(
              'Write a review',
              color: colors.accentPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
