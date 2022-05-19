import 'package:aactivpay/export.dart';
import 'package:flutter/cupertino.dart';

class VerticalDotedDivider extends StatelessWidget {
  final double height;
  final Color color;
  VerticalDotedDivider(this.height, this.color);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final boxWidth = constraints.constrainWidth();
      final dashWidth = 2.0;
      final dashHeight = height;
      final dashCount = 8;
      return Flex(
        children: List.generate(dashCount, (_) {
          return Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Column(
              children: [
                SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: color),
                  ),
                ),
                SizedBox(height: 2,)
              ],
            ),
          );
        }),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.vertical,
      );
    });
  }
  // throw UnimplementedError();

}
