import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileImage extends StatelessWidget {
  final pickImageCallBack;
  const ProfileImage({Key key, this.pickImageCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImageCallBack,
      child: Center(
        child: Container(
          height: sizes.widthRatio * 80,
          width: sizes.widthRatio * 80,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.accentPrimary,
          ),
          child: SvgPicture.asset(
            assets.icProfile,
          ),
        ),
      ),
    );
  }
}
