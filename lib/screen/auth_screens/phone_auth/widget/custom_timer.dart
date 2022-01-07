import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class CustomTimer extends StatefulWidget {
  CustomTimer({Key key, this.resend}) : super(key: key);

  final Function resend;

  @override
  _CustomTimerState createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer>
    with TickerProviderStateMixin {
  AnimationController _controller;
  int levelClock = 150;

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
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      child: Countdown(
        animation: StepTween(
          begin: levelClock, // THIS IS A USER ENTERED NUMBER
          end: 0,
        ).animate(_controller),
        controller: _controller,
        resend: widget.resend,
      ),
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
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    // print('animation.value  ${animation.value} ');
    // print('inMinutes ${clockTimer.inMinutes.toString()}');
    // print('inSeconds ${clockTimer.inSeconds.toString()}');
    // print(
    //     'inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');
    if (clockTimer.inSeconds == 0) {
      controller.reset();
    }

    return (clockTimer.inSeconds != 0)
        ? Padding(
            padding: const EdgeInsets.all(5.6),
            child: Text("$timerText",
                style: TextStyle(
                    color: colors.appColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          )
        : FlatButton(
            child: Text("RESEND",
                style: TextStyle(
                    color: colors.appColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            onPressed: () {
              controller.repeat(max: 1);
              resend();
            },
          );
  }
}
