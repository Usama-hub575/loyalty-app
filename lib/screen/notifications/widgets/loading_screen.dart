import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class NotificationsLoadingScreen extends StatelessWidget {
  NotificationsLoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return getLoader();*/
    return getShimmerLoader();
  }

  Widget getShimmerLoader() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          verticalSpacer(30),
          AppBarWidget(
            title: 'Notifications',
            onBack: () {},
          ),
          SizedBox(
            height: sizes.height,
            child: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
              return getStoreCard();
            }),
          ),
        ],
      ),
    );
  }

  getStoreCard() {
    return Container(
      width: sizes.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: colors.primaryLight,
          ),
          horizontalSpacer(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: sizes.width * 0.60,
                height: 10,
                color: colors.primaryDark.withOpacity(0.2),
              ),
              verticalSpacer(6),
              Container(
                width: sizes.width * 0.30,
                height: 10,
                color: colors.primaryDark.withOpacity(0.2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
