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
            onCross: controller.onBack,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
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
                  ),
                  verticalSpacer(10),
                  Categories(categories: controller.categories),
                  verticalSpacer(20),
                  LocationCard(),
                  EarnPointsCard(),
                  verticalSpacer(20),
                  RecentTransactions(controller.recentTransactions),
                  InviteCard(),
                  RateStore(onTap: controller.openReviewPage),
                  RatingAndReviews(
                    reviews: controller.reviews,
                  ),
                  SocialIcons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
