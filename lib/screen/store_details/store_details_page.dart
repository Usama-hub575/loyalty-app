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
          StoreAppBar(
            controller.storeName,
            onCross: controller.onBack,
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
                  assets.icStar,
                  width: 14,
                  height: 14,
                ),
                horizontalSpacer(6),
                BodyExtraSmallText('3/5'),
                horizontalSpacer(10),
                SvgPicture.asset(
                  assets.icCoin,
                  width: 14,
                  height: 14,
                ),
                horizontalSpacer(6),
                BodyExtraSmallText('30K'),
              ],
            );
          case StoreDetailsDataType.CATEGORIES:
            return Categories(categories: controller.categories);
          case StoreDetailsDataType.ADDRESS:
            return LocationCard(
              controller.getData(index).nearestBranch.geoDecodedAddress,
              hasMultipleBranches:
                  controller.getData(index).hasMultipleBranches,
            );
          case StoreDetailsDataType.POINT_CARD:
            return EarnPointsCard();
          case StoreDetailsDataType.TRANSACTIONS:
            return RecentTransactions(controller.recentTransactions);
          case StoreDetailsDataType.INVITE_CARD:
            return InviteCard();
          case StoreDetailsDataType.WRITE_REVIEW:
            return RateStore(onTap: controller.openReviewPage);
          case StoreDetailsDataType.RATINGS:
            return Ratings(controller.getData(index));
          case StoreDetailsDataType.REVIEWS:
            return Reviews(
              reviews: controller.reviews,
              seeAll: controller.openAllReviewPage,
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
