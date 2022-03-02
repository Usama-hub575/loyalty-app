import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 30,
            color: colors.primaryDark,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: colors.primaryLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpacer(150),
              controller.component.getSignInText(),
              verticalSpacer(10),
              controller.component.getEmailField(),
              verticalSpacer(20),
              controller.component.getPasswordField(),
              controller.component.getForgetPasswordButton(null),
              verticalSpacer(20),
              controller.component.getSignInButton(null),
              verticalSpacer(130),
              controller.component.getRegisterButton(null),
            ],
          ),
        ),
      ),
    );
  }
}
