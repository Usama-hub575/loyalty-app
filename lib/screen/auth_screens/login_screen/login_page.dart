import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/export.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 30,
            color: colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: colors.white,
      body: Center(
        child: Text(
          'Well come to Login Page',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: colors.black,
          ),
        ),
      ),
    );
  }
}
