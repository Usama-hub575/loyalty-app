import 'package:aactivpay/export.dart';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FloatingAction extends StatelessWidget {
  final onPressed;

  const FloatingAction({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Stack(children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colors.white,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            assets.icFloatingButton,
          ),
        ),
        Obx(
          () => CircularCountdown(
            strokeWidth: 5,
            countdownCurrentColor: colors.accentPrimary,
            countdownTotal: 60,
            countdownRemaining: 60 - timeValue.value.toInt(),
            countdownRemainingColor: colors.transparent,
            diameter: 65,
            countdownTotalColor: colors.accentPrimary,
            gapFactor: 2,
          ),
        ),
      ]),
    );
  }
}
