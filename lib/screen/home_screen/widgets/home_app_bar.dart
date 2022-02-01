import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colors.primaryLight,
      elevation: 0,
      leading: Container(
        padding: EdgeInsets.all(16),
        child: SvgPicture.asset(assets.icMenu),
      ),
      title: SvgPicture.asset(assets.icAactivpay),
      centerTitle: true,
      actions: [
        SvgPicture.asset(assets.icSearch),
        horizontalSpacer(12),
        SvgPicture.asset(assets.icNotification),
        horizontalSpacer(20),
      ],
    );
  }
}
