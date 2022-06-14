import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoreCard extends StatelessWidget {
  final StoresList data;
  final Function openStoreDetails;
  final Function seeAllStore;

  const StoreCard(this.data, {Key key, this.openStoreDetails, this.seeAllStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      height: sizes.heightRatio * 240,
      padding: EdgeInsets.symmetric(vertical: verticalValue(20)),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => index != 10
            ? SmallCard(
                data: data.list[index],
                onTap: openStoreDetails,
              )
            : getSeeAllButton(seeAllStore),
        separatorBuilder: (BuildContext context, int index) =>
            horizontalSpacer(0),
        itemCount: data.list.length < 10 ? data.list.length : 11,
      ),
    );
  }

  Widget getSeeAllButton(seeAllStore) {
    return GestureDetector(
      onTap: seeAllStore,
      child: Container(
        width: sizes.widthRatio * 180,
        padding: EdgeInsets.symmetric(
            horizontal: horizontalValue(20), vertical: verticalValue(14)),
        margin: EdgeInsets.symmetric(
            horizontal: horizontalValue(38), vertical: horizontalValue(84)),
        decoration: BoxDecoration(
          color: colors.accentPrimary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              'See all',
              style: textStyles.bodySmall.copyWith(
                color: colors.white,
              ),
            ),
            Spacer(),
            SvgPicture.asset(assets.icRightArrow, color: colors.white),
          ],
        ),
      ),
    );
  }
}
