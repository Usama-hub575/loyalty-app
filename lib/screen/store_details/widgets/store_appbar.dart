import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreAppBar extends StatelessWidget {
  final Function onCross;
  final String name;

  const StoreAppBar(this.name, {Key key, this.onCross}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          width: sizes.width * 0.8,
          child: HeadingLargeText(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Spacer(),
        AppIconButton(
          assets.icCross,
          onTap: onCross,
        ),
      ],
    );
  }
}
