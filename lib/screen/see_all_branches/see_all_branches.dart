import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SeeAllBranchesPage extends GetView<SeeAllBranchesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:getBody()
      // controller.obx(
      //   (state) => getBody(),
        // onError: getErrorState(),
        // onLoading: getErrorState(),
        // onEmpty: getErrorState(),
      // ),
    );
  }

  getBody() {
    return Column(
      children: [
        verticalSpacer(30),
        AppBarWidget(
          title: 'All Branches',
          onBack: controller.onBack,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: controller.allBranchesList.length,
            itemBuilder: (context, index) {
              return getAllBranches(controller.allBranchesList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return verticalSpacer(5);
            },
          ),
        ),
      ],
    );
  }

  Widget getAllBranches(String branchAddress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: sizes.heightRatio * 70,
        width: sizes.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: colors.white,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(assets.icLocationBlue),
              backgroundColor: colors.primaryLight,
            ),
            horizontalSpacer(10),
            Expanded(child: BodyLargeText(branchAddress)),
          ],
        ),
      ),
    );
  }

  getErrorState() {}

  getEmptyState() {}

  getLoadingState() {}
}
