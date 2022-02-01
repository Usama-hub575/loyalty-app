import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color color;

  HorizontalDivider({
    Key key,
    this.width = double.infinity,
    this.height = 1.0,
    this.color = Colors.grey,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
