import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoreDetailsPage extends GetView<StoreDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacer(30),
          Container(
            height: sizes.heightRatio * 50,
            child: StoreAppBar(
              controller.storeName,
              onCross: controller.onBack,
            ),
          ),
          Expanded(
            child: controller.obx(
              (state) => getBody(),
              onLoading: Center(child: StoreDetailsLoading()),
            ),
          ),
        ],
      ),
    );
  }

  getBody() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) {
        final StoreDetailsDataType type = controller.useCase.data[index].type;
        switch (type) {
          case StoreDetailsDataType.RATINGS_ERANEDPOINTS:
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                horizontalSpacer(20),
                SvgPicture.asset(
                  assets.icStarStoreDetails,
                  width: 14,
                  height: 14,
                ),
                horizontalSpacer(6),
                BodyExtraSmallText('${controller.getData(index).rating}/5'),
                horizontalSpacer(10),
                SvgPicture.asset(
                  assets.icCoin,
                  width: 14,
                  height: 14,
                ),
                horizontalSpacer(6),
                BodyExtraSmallText(controller.getData(index).redeemLimit.toString()),
              ],
            );
          case StoreDetailsDataType.CATEGORIES:
            return Categories(categories: controller.getData(index));
          case StoreDetailsDataType.ADDRESS:
            return LocationCard(
              controller.getData(index).nearestBranch.geoDecodedAddress,
              hasMultipleBranches:
                  controller.getData(index).hasMultipleBranches,
              onSeeAllBranch: controller.openAllBranches,
            );
          case StoreDetailsDataType.POINT_CARD:
            return EarnPointsCard();
          case StoreDetailsDataType.TRANSACTIONS:
            return RecentTransactions(controller.recentTransactions);
          case StoreDetailsDataType.INVITE_CARD:
            return InviteCard();
          case StoreDetailsDataType.WRITE_REVIEW:
            return RateStore(
              store: controller.getData(index),
              onTap: controller.openReviewPage,
            );
          case StoreDetailsDataType.RATINGS:
            return Ratings(controller.getData(index));
          case StoreDetailsDataType.REVIEWS:
            return Reviews(
              reviews: controller.getData(index),
              seeAll: controller.openAllReviewPage,
              showSeeAllButton: true,
            );
          case StoreDetailsDataType.SOCIAL_LINKS:
            return SocialIcons();
          case StoreDetailsDataType.SPACE:
            return verticalSpacer(10);
          default:
            return verticalSpacer(0);
        }
      },
      itemCount: controller.useCase.data.length,
    );
  }
}
