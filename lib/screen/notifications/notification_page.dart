import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Notifications extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((state) => getBody(context),
          onLoading: NotificationsLoadingScreen()),
    );

    //throw UnimplementedError();
  }

  getBody(BuildContext context) {
    return Column(
      children: [
        verticalSpacer(30),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: horizontalValue(20.0)),
          child: AppBarWidget(
            title: 'Notifications',
            onBack: controller.onBack,
          ),
        ),
        Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: controller.notificationsList.length,
            itemBuilder: (context, index) {
              return getAllNotifications(controller.notificationsList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return verticalSpacer(5);
            },
          ),
        ),
      ],
    );
  }

  getAllNotifications(String notificationsList) {
    return Container(
      width: sizes.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            child: SvgPicture.asset(assets.icDocumentNotification),
            backgroundColor: colors.primaryLight,
          ),
          horizontalSpacer(10),
          Expanded(child: BodyLargeText(notificationsList)),
        ],
      ),
    );
  }

}
