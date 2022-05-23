import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../export.dart';

class CategoriesFilter extends StatelessWidget{
  final List<Category> dataList;
  final Function onTap;
  final Function onSeeAllTap;
  final Function onApplyTap;
  final int pillsCount;
  final double size;
  final Color backGroundColor;

  const CategoriesFilter({
    Key key,
    this.dataList,
    this.pillsCount = 30,
    this.size = 4,
    this.onSeeAllTap,
    this.backGroundColor,
    this.onTap,
    this.onApplyTap
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      color: colors.white,
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 14, left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  'Categories',
                  style: textStyles.headingRegular,
                ),
                Spacer(),
                GestureDetector(
                  onTap: onSeeAllTap,
                  child: Text(
                    'See all',
                    style: textStyles.bodySmall
                        .copyWith(color: colors.accentPrimary),
                  ),
                )
              ],
            ),
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Container(
          //     padding: EdgeInsets.all(20),
          //     width: sizes.width * size,
          //     color: backGroundColor ?? colors.white,
          //     child: Wrap(
          //       children: List.generate(
          //         pillsCount,
          //         (index) => getChip(dataList[index], index, onTap),
          //         growable: true,
          //       ),
          //     ),
          //   ),
          // ),
          FilterPills(
            pillsCount: pillsCount,
            dataList: dataList,
            onTap: onTap,
            key: key,
            size: size,
            backGroundColor: backGroundColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onApplyTap,
                  child: Text(
                    'Apply',
                    style: textStyles.bodySmall
                        .copyWith(color: colors.accentPrimary),
                  ),
                ),
                Spacer(),
                SvgPicture.asset(
                  assets.icRightArrow,
                  color: colors.accentPrimary,
                ),
              ],
            ),
          ),
          verticalSpacer(15)
        ],
      ),
    );
  }
}
