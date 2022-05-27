import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final Function onChange;
  final bool isChecked;
  final double size;
  final double iconSize;
  final Color selectedColor;
  final Color selectedIconColor;
  final Color borderColor;
  final Icon checkIcon;

  CustomCheckbox(
      {this.isChecked,
      this.onChange,
      this.size,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor,
      this.borderColor,
      this.checkIcon});

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _isSelected = !_isSelected;
          this.onChange(_isSelected);
        },
        child: AnimatedContainer(
          margin: EdgeInsets.all(4),
          duration: Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
              color: _isSelected
                  ? this.selectedColor ?? Colors.blue
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(
                color: this.borderColor ?? Colors.black,
                width: 1.5,
              )),
          width: this.size ?? 18,
          height: this.size ?? 18,
          child: _isSelected
              ? Icon(
                  Icons.check,
                  color: this.selectedIconColor ?? Colors.blue,
                  size: this.iconSize ?? 14,
                )
              : null,
        ));
  }
}
