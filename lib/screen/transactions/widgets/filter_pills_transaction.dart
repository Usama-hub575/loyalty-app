import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPillsTransaction extends StatelessWidget {
  final List<Category> dataList;
  final Function onTap;
  final int pillsCount;
  final double size;
  final Color backGroundColor;

  const FilterPillsTransaction({
    Key key,
    this.dataList,
    this.pillsCount = 30,
    this.size = 4,
    this.backGroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20,bottom: 20),
      width: sizes.width * size,
      color: backGroundColor ?? colors.white,
       child: SizedBox(
         height: verticalValue(
           30,
         ),
         child:  ListView.separated(
           physics: const BouncingScrollPhysics(),
           itemBuilder: (_, index) =>getChip(dataList[index], index, onTap),
           scrollDirection: Axis.horizontal,
           shrinkWrap: true,
           separatorBuilder: (_, index) {
             return SizedBox(
               width: horizontalValue(
                 10,
               ),
             );
           },
           itemCount: pillsCount,
         ),
       ),
    );
  }

  Widget getChip(Category pills, index, onTap) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
      ),
      child: Obx(
            () => ActionChip(
          onPressed: () => onTap(index),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          label: Text(
            pills.name,
            style: textStyles.bodySmall.copyWith(
              color: pills.isActive.value ? colors.white : colors.black,
            ),
          ),
          backgroundColor: pills.isActive.value
              ? colors.accentPrimary
              : colors.primaryDark.withOpacity(0.05),
        ),
      ),
    );
  }
}
