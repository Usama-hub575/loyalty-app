import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double max;
  final double current;
  final Color color;
  final double height;

  const ProgressBar({
    Key key,
    @required this.max,
    @required this.current,
    this.color,
    this.height = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, boxConstraints) {
        var x = boxConstraints.maxWidth;
        var percent = (current / max) * x;
        return Stack(
          children: [
            Container(
              width: x,
              height: height,
              decoration: BoxDecoration(
                color: Color(0xffd3d3d3),
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: percent,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          ],
        );
      },
    );
  }
}
