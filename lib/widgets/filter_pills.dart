import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPills extends StatelessWidget {
  final List<Category> dataList;
  final Function onTap;
  final int pillsCount;
  final double size;
  final Color backGroundColor;

  const FilterPills({
    Key key,
    this.dataList,
    this.pillsCount = 30,
    this.size = 4,
    this.backGroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(20),
        width: sizes.width * size,
        color: backGroundColor ?? colors.white,
        child: Wrap(
          children: List.generate(
            pillsCount,
            (index) => getChip(dataList[index], index, onTap),
            growable: true,
          ),
        ),
      ),
    );
  }

  Widget getChip(Category pills, index, onTap) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
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
