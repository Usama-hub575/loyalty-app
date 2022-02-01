import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class CustomTimer extends StatelessWidget {
  final int seconds;
  final Function onTimeComplete;
  final CountdownTimerController timeController;

  const CustomTimer({
    Key key,
    this.seconds,
    this.onTimeComplete,
    this.timeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: seconds,
      onEnd: onTimeComplete,
      controller: timeController,
      widgetBuilder: (_, CurrentRemainingTime time) => getCustomTimer(time),
    );
  }
  Widget getCustomTimer(time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 55,
          child: time == null
              ? Text(
            '00:00',
            style: textStyles.bodyLarge,
          )
              : Text(
            '${time.min?.toString()?.padLeft(2, '0') ?? '00'}:${time.sec.toString().padLeft(2, '0')}',
            style: textStyles.bodyLarge,
          ),
        ),
        Text(
          'sec',
          style: textStyles.bodyLarge,
        ),
      ],
    );
  }

}
