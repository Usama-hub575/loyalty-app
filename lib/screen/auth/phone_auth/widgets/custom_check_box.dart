import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckbox extends StatelessWidget {
  final Function onChange;
  final bool isChecked;

  CustomCheckbox({
    this.isChecked,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onChange, child: isChecked ? getChecked() : getUnChecked()
        /*AnimatedContainer(
          margin: EdgeInsets.all(4),
          duration: Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(
                color: _isSelected
                    ? this.selectedColor ?? Colors.blue
                    : Colors.transparent,
                width: 1.5,
              )),
          width: this.size ?? 16,
          height: this.size ?? 16,
          child: _isSelected
              ? Center(
                  child: Icon(
                    Icons.check,
                    color: this.selectedIconColor ?? Colors.blue,
                    size: this.iconSize ?? 6,
                  ),
                )
              : null,
        )*/
        );
  }

  getUnChecked() {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(3),
          ),
          shape: BoxShape.rectangle,
          border: Border.all(
              color: colors.primaryDark.withOpacity(0.20), width: 2.5)),
    );
  }

  getChecked() {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(3),
          ),
          shape: BoxShape.rectangle,
          border: Border.all(color: colors.accentPrimary, width: 2.2)),
      child: Center(
        child: SvgPicture.asset(
          assets.icTickAuth,
          color: colors.accentPrimary,
          width: 9,
          height: 7,
        ),
      ),
    );
  }
}
