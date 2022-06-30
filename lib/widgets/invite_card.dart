import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class InviteCard extends StatelessWidget {
  const InviteCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      color: colors.otherYellow,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getInviteHeadingText('Invite your friends to earn Free Cash '),
          horizontalSpacer(30),
          gatInviteCodeBox(
            context: context,
          ),
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
            child: SvgPicture.asset(
              assets.icMoneyBag,
              height: 24,
              width: 24,
            ),
          )
        ],
      ),
    );
  }

  Widget gatInviteCodeBox({@required BuildContext context}) {
    return GestureDetector(
      onTap: () => copyToClipboard(
        value: 'getapp.aactivpay.com',
        context: context,
      ),
      child: Container(
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
            Container(
              width: sizes.widthRatio * 200,
              child: Text(
                'getapp.aactivpay.com',
                style: textStyles.headingRegular,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            verticalSpacer(8),
            Text(
              'Tap to copy to clipboard',
              style: textStyles.bodyExtraSmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget getInviteButton() {
    return LongButton('Invite');
  }
}
