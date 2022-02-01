import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoreCard extends StatelessWidget {
  final List data;

  const StoreCard(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      height: sizes.heightRatio * 240,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) =>
            index != 10 ? SmallCard() : getSeeAllButton(),
        separatorBuilder: (BuildContext context, int index) =>
            horizontalSpacer(0),
        itemCount: 11,
      ),
    );
  }
  Widget getSeeAllButton() {
    return Container(
      width: sizes.widthRatio * 180,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      margin: EdgeInsets.symmetric(horizontal: 38, vertical: 84),
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
          SvgPicture.asset(assets.icRight, color: colors.white),
        ],
      ),
    );
  }

}
