import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPills extends StatelessWidget {
  final List<ScrollingPills> dataList1, dataList2, dataList3;
  final Function onTap;

  const FilterPills({
    Key key,
    this.dataList1,
    this.dataList2,
    this.dataList3,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.white,
      padding: EdgeInsets.only(top: 20, left: 10, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Row(
            children: List.generate(
              dataList1.length,
              (index) => getChip(dataList1[index], index, 1, onTap),
              growable: true,
            ),
          ),
          Row(
            children: List.generate(
              dataList2.length,
              (index) => getChip(dataList2[index], index, 2, onTap),
              growable: true,
            ),
          ),
          Row(
            children: List.generate(
              dataList3.length,
              (index) => getChip(dataList3[index], index, 3, onTap),
              growable: true,
            ),
          ),
        ]),
      ),
    );
  }

  Widget getChip(ScrollingPills pills, index, list, onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 5),
      child: GestureDetector(
        onTap: () => onTap(index, list),
        child: Obx(
          () => Chip(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            label: Text(
              pills.title,
              style: textStyles.bodySmall.copyWith(
                color: pills.isActive.value ? colors.white : colors.black,
              ),
            ),
            backgroundColor: pills.isActive.value
                ? colors.accentPrimary
                : colors.primaryDark.withOpacity(0.05),
          ),
        ),
      ),
    );
  }
}
