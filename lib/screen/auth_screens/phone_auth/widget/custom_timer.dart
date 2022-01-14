import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class CustomTimer extends StatefulWidget {
  CustomTimer({
    Key key,
  }) : super(key: key);

  @override
  _CustomTimerState createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer>
    with TickerProviderStateMixin {
  AnimationController _controller;
  int levelClock = 60;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: levelClock,
        ) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Countdown(
      animation: StepTween(
        begin: levelClock, // THIS IS A USER ENTERED NUMBER
        end: 0,
      ).animate(_controller),
      controller: _controller,
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation, this.controller, this.resend})
      : super(key: key, listenable: animation);
  Animation<int> animation;
  final AnimationController controller;
  final Function resend;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '00:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    if (clockTimer.inSeconds == 0) {
      controller.reset();
    }

    return Text(
      timerText,
      style: textStyles.regularManrope.copyWith(
        color: colors.primaryDark,
        fontWeight: FontWeight.w300,
        fontSize: 15,
      ),
    );
  }
}
