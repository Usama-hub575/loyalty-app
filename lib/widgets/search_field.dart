import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  final bool readOnly;

  const SearchField({Key key, this.readOnly = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getSearchField();
  }

  Widget getSearchField() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          getIcon(assets.icSearch),
          horizontalSpacer(20),
          inputField(),
        ],
      ),
    );
  }

  Widget inputField() => Expanded(
        child: GetX<HomePageController>(builder: (controller) {
          return TextFormField(
            autofocus: false,
            readOnly: readOnly,
            style: textStyles.regularManrope.copyWith(
              color: colors.primaryDark,
              fontSize: sizes.fontRatio * 16,
            ),
            controller: controller.searchController.value,
            decoration: InputDecoration(
              hintText: 'Search Store',
              hintStyle: textStyles.regularManrope.copyWith(
                color: colors.grey,
                fontSize: sizes.fontRatio * 14,
              ),
              focusColor: colors.appColor,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          );
        }),
      );

  Widget getIcon(String icon) {
    return SvgPicture.asset(icon);
  }
}
