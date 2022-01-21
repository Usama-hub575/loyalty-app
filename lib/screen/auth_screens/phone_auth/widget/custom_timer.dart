import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';
import 'package:flutter_countdown_timer/index.dart';

class CountDownTime extends StatelessWidget {
  final int sec;
  final Function onEnd;

  CountDownTime(this.sec, this.onEnd);

  CountdownTimerController controller;
  int endTime;

  @override
  Widget build(BuildContext context) {
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * sec;
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    return CountdownTimer(
      controller: controller,
      onEnd: onEnd,
      endTime: endTime,
      widgetBuilder: (context, CurrentRemainingTime time) {
        if (time == null) {
          return Text(
            '00:00',
            style: textStyles.regularManrope.copyWith(
              color: colors.primaryDark,
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          );
        }
        return Text(
          '${time.min?.toString()?.padLeft(2, '0') ?? '00'}:${time.sec.toString().padLeft(2, '0')} sec',
          style: textStyles.regularManrope.copyWith(
            color: colors.primaryDark,
            fontWeight: FontWeight.w300,
            fontSize: 15,
          ),
        );
      },
    );
  }
}
