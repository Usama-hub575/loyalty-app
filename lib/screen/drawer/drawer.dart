import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends GetView<CustomDrawerController> {
  final String imageUrl;
  final String name;
  final String email;
  CustomDrawer({Key key, this.name, this.imageUrl, this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: sizes.height,
        width: sizes.width,
        color: colors.primaryLight,
        child: Column(
          children: [
            verticalSpacer(40),
            CircleAvatar(
                backgroundImage: this.imageUrl.isNotEmpty
                    ? NetworkImage(this.imageUrl.toString())
                    : NetworkImage(
                        'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1649690153~exp=1649690753~hmac=67ba9b412ac84e99c518a415dc3bc3e172da33d582e15730d1716ba073a11f51'),
                maxRadius: 40),
            verticalSpacer(10),
            HeadingRegularText(this.name.toString()),
            verticalSpacer(19),
            Container(
              color: colors.accentPrimary.withOpacity(0.1),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                title: RichText(
                  text: TextSpan(
                      text: 'Account Balance ',
                      style: TextStyle(
                          color: colors.primaryDark,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: '(Euro Store)',
                          style: TextStyle(
                              color: colors.primaryDark,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                ),
                trailing: SvgPicture.asset(assets.icAccountBalanceArrow),
                subtitle: RichText(
                  text: TextSpan(
                      text: 'RS 500 ',
                      style: TextStyle(
                          color: colors.accentPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: '(expires on 23th March, 2022)',
                          style: TextStyle(
                              color: colors.error,
                              fontSize: 8,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                ),
              ),
            ),
            CustomDrawerItem(
              icon: assets.icHome,
              title: 'Home',
            ),
            verticalSpacer(2),
            CustomDrawerItem(
              icon: assets.icWallet,
              title: 'Wallet',
            ),
            verticalSpacer(2),
            CustomDrawerItem(
              icon: assets.icHowItWorks,
              title: 'How it works',
            ),
            verticalSpacer(2),
            CustomDrawerItem(
              icon: assets.icTermOfUse,
              title: 'Terms of use',
            ),
            verticalSpacer(2),
            CustomDrawerItem(
              icon: assets.icContactSupport,
              title: 'Contact support',
            ),
            Spacer(),
            SvgPicture.asset(assets.icAactivpay, color: colors.primaryDark.withOpacity(0.1),),
            verticalSpacer(5),
            BodyExtraSmallText('v1.0 (100)', color: colors.primaryDark.withOpacity(0.1),),
            verticalSpacer(26),
          ],
        ),
      ),
    );
  }
}
