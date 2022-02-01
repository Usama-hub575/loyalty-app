import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InviteCard extends StatelessWidget {
  const InviteCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      color: colors.tieYellow,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getInviteHeadingText('Invite your friends to earn Free points '),
          horizontalSpacer(30),
          gatInviteCodeBox(),
          getInviteButton(),
        ],
      ),
    );
  }
  Widget getInviteHeadingText(text) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text.toUpperCase(),
            style: textStyles.headingLarge.copyWith(
              color: colors.black,
            ),
          ),
          WidgetSpan(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: SvgPicture.asset(
                assets.icWhiteCoin,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget gatInviteCodeBox() {
    return Container(
      width: sizes.width,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '5 A 3 F 8 3 C',
            style: textStyles.headingLarge,
          ),
          verticalSpacer(10),
          Text(
            'Tap to copy to clipboard',
            style: textStyles.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget getInviteButton() {
    return LongButton('Invite');
  }

}
