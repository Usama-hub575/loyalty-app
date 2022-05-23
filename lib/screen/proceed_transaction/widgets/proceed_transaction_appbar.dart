import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class ProceedTransactionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Function onBack;
  final String title;

  ProceedTransactionAppBar(this.title, {Key key, this.onBack})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colors.primaryLight,
      elevation: 0,
      centerTitle: true,
      leading :Padding(
        padding: const EdgeInsets.all(20),
        child: AppIconButton(
          assets.icBack,
          onTap: onBack,
        ),
      ),
      title: HeadingRegularText(
        title,
      ),
    );
  }
}
