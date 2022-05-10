import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';
import 'package:flutter_svg/svg.dart';

class EmptyNotificationsScreen extends StatelessWidget {
  EmptyNotificationsScreen({Key key}) : super(key: key);

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
          Container(
            height: sizes.height/1.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 88,
                  child: SvgPicture.asset(assets.icNotificationWithoutDot),
                  backgroundColor: colors.white,
                ),
                verticalSpacer(20),
                BodyRegularText("Notification not found",)
              ],
            ),
          ),
        ],
      ),
    );
  }

}
