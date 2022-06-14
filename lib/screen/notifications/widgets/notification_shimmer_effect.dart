import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class NotificationShimmerEffect extends StatelessWidget {
  final Function onBackButtonTap;

  const NotificationShimmerEffect({
    Key key,
    @required this.onBackButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(20.0),
      ),
      child: Column(
        children: [
          verticalSpacer(39),
          AppBarWidget(
            title: 'Notifications',
            onBack: () => onBackButtonTap(),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return getStoreCard();
            },
            separatorBuilder: (_, index) {
              return verticalSpacer(
                10,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget getStoreCard() {
    return Container(
      padding: EdgeInsets.only(
        left: horizontalValue(
          10,
        ),
        right: horizontalValue(
          15,
        ),
      ),
      height: verticalValue(
        100,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: colors.white,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: verticalValue(
                  30,
                ),
                backgroundColor: colors.primaryDark.withOpacity(
                  0.1,
                ),
              ),
            ],
          ),
          horizontalSpacer(
            11,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: sizes.width * 0.6,
                height: verticalValue(
                  10,
                ),
                color: colors.primaryDark.withOpacity(0.2),
              ),
              verticalSpacer(18),
              Container(
                width: horizontalValue(
                  98,
                ),
                height: verticalValue(
                  10,
                ),
                color: colors.primaryDark.withOpacity(0.2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
