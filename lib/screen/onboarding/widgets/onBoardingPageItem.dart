import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final String image;

  OnboardingItem(Key key, {this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: Image.asset(
        image,
        key: key,
        fit: BoxFit.fill,
      ),
    );
  }
}
