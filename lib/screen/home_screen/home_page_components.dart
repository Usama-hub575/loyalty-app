import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePageComponents {
  Widget getTitle(text, size) {
    return Text(
      text,
      style: textStyles.extraBoldMontserrat.copyWith(
        fontSize: size,
      ),
    );
  }

  Widget getIcon(String icon) {
    return SvgPicture.asset(icon);
  }

  Widget getScrollingPills(pillsList, onTap) {
    return Container(
      width: sizes.width,
      height: sizes.heightRatio * 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) =>
            getPill(pillsList[index], index, onTap),
        separatorBuilder: (BuildContext context, int index) =>
            horizontalSpacer(10),
        itemCount: pillsList.length,
      ),
    );
  }

  Widget getPill(ScrollingPills pills, index, onTap) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            color: pills.isActive.value ? colors.appColor : colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              pills.title,
              style: textStyles.regularManrope.copyWith(
                color: pills.isActive.value ? colors.white : colors.primaryDark,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getRecommendedList({title, data, onSeeAll}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            getTitle(title, 18.0),
            Spacer(),
            getSeeAllButton(onSeeAll),
          ],
        ),
        getSmallCardList(data),
      ],
    );
  }

  Widget getPopularList({title, data, onSeeAll}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            getTitle(title, 18.0),
            Spacer(),
            getSeeAllButton(onSeeAll),
          ],
        ),
        getMediumCardList(data),
      ],
    );
  }

  Widget getNearByList({title, data, onSeeAll}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            getTitle(title, 18.0),
            Spacer(),
            getSeeAllButton(onSeeAll),
          ],
        ),
        getFullCardList(data),
        verticalSpacer(16),
        getIndicators(),
      ],
    );
  }

  Widget getSeeAllButton(onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        'See all',
        style: textStyles.regularManrope.copyWith(
          color: colors.appColor,
        ),
      ),
    );
  }

  Widget getSmallCardList(List data) {
    return Container(
      width: sizes.width,
      height: sizes.heightRatio * 230,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) =>
            SmallCard(data: data[index]),
        separatorBuilder: (BuildContext context, int index) =>
            horizontalSpacer(16),
        itemCount: data.length,
      ),
    );
  }

  Widget getMediumCardList(List data) {
    return Container(
      width: sizes.width,
      height: sizes.heightRatio * 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) =>
            MediumCard(data: data[index]),
        separatorBuilder: (BuildContext context, int index) =>
            horizontalSpacer(16),
        itemCount: data.length,
      ),
    );
  }

  Widget getFloatingActionButton({onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.appColor,
          boxShadow: [
            BoxShadow(
              color: colors.appColor.withOpacity(0.2),
              spreadRadius: 6,
            )
          ],
        ),
        child: getIcon(assets.icQR),
      ),
    );
  }

  Widget getMapCard({title}) {
    return Container(
      width: sizes.width,
      height: sizes.heightRatio * 160,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            assets.exploreAroundYou,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getTitle(title, 18.0),
          verticalSpacer(12),
          getShowMapButton(),
        ],
      ),
    );
  }

  Widget getShowMapButton() {
    return Container(
      width: sizes.widthRatio * 125,
      height: sizes.heightRatio * 30,
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Show map',
            style: textStyles.regularManrope,
          ),
          getIcon(assets.icRight),
        ],
      ),
    );
  }

  Widget getFullCardList(data) {
    return Container(
      height: 170,
      child: GetX<HomePageController>(
        builder: (controller) => PageView.builder(
          controller: controller.pageController,
          physics: BouncingScrollPhysics(),
          onPageChanged: (index) {
            controller.updatePage(index: index);
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: controller.pageChildren[index],
            );
          },
          itemCount: controller.pageChildren.length,
        ),
      ),
    );
  }

  Widget getIndicators() {
    return GetX<HomePageController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.pageChildren.length,
          (index) => getCircle(controller.currentPage.value == index),
          growable: false,
        ),
      ),
    );
  }

  Widget getCircle(bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: isSelected ? 20 : 5,
      height: 5,
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          color: isSelected ? colors.appColor : colors.appColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
