import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTitle('Hi, Janifer', 28.0),
            getWelcomeText(),
          ],
        ),
        Spacer(),
        getIcon(assets.icNotification),
        horizontalSpacer(16),
        getProfileImage(assets.profileImage),
      ],
    );
  }

  Widget getTitle(text, size) {
    return Text(
      text,
      style: textStyles.extraBoldMontserrat.copyWith(
        fontSize: size,
      ),
    );
  }

  Widget getWelcomeText() {
    return Text(
      'Welcome Back',
      style: textStyles.regularManrope,
    );
  }


  Widget getIcon(String icon) {
    return SvgPicture.asset(icon);
  }

  Widget getProfileImage(String image) {
    return Container(
      width: sizes.widthRatio * 50,
      height: sizes.widthRatio * 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: colors.appColor,
          width: 3,
        ),
      ),
      child: Image.asset(image),
    );
  }

}
