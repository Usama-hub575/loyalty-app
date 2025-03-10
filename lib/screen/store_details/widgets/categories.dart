import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final CategoriesList categories;

  const Categories({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalValue(20)),
      width: double.infinity,
      height: 22,
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BodyExtraSmallText(
            categories.categories[index].name,
            color: colors.accentPrimary,
          );
        },
        separatorBuilder: (context, index) {
          return getDivider();
        },
        itemCount: categories.categories.length,
      ),
    );
  }

  Widget getDivider() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: horizontalValue(10)),
      child: Container(
        color: colors.black.withOpacity(0.2),
        width: 2,
      ),
    );
  }
}
