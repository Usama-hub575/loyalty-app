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
      leading: AppIconButton(
        assets.icMenu,
        onTap: onMenuTap,
      ),
      title: SvgPicture.asset(assets.icAactivpay),
      centerTitle: true,
      actions: [
        AppIconButton(
          assets.icSearch,
          onTap: onSearchTap,
        ),
        AppIconButton(
          assets.icNotification,
          onTap: onNotificationTap,
        ),
        horizontalSpacer(12),
      ],
    );
  }
}
