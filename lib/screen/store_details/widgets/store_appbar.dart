import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreAppBar extends StatelessWidget {
  final Function onCross;

  const StoreAppBar({Key key, this.onCross}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Row(
        children: [
          horizontalSpacer(10),
          HeadingLargeText('Euro Store'),
          Spacer(),
          AppIconButton(
            assets.icCross,
            onTap: onCross,
          ),
        ],
      ),
    );
  }
}
