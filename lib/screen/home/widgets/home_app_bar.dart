import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final onNotificationTap;
  final onMenuTap;
  final onSearchTap;

  HomeAppBar(
    this.onNotificationTap,
    this.onMenuTap,
    this.onSearchTap, {
    Key key,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colors.primaryLight,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(16),
        child: AppIconButton(
          assets.icMenu,
          onTap: onMenuTap,
        ),
      ),
      title: SvgPicture.asset(assets.icAactivpay),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: horizontalValue(15)),
          child: AppIconButton(
            assets.icSearch,
            onTap: onSearchTap,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: horizontalValue(10)),
          child: AppIconButton(
            assets.icNotification,
            onTap: onNotificationTap,
          ),
        ),
        horizontalSpacer(10),
      ],
    );
  }
}
