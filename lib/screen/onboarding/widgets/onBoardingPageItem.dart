import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final String image;

  OnboardingItem(Key key, {this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      key: key,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
