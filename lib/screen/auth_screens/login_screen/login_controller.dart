import 'package:domain/export.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class LoginController extends GetxController with StateMixin<LoginPage> {
  final AuthUseCase useCase;

  LoginController(this.useCase);


  Rx<TextEditingController> emailController;
  Rx<TextEditingController> passwordController;
  LoginComponent component;


  init() {
    emailController = TextEditingController().obs;
    passwordController = TextEditingController().obs;

    component = LoginComponent(emailController.value, passwordController.value);
  }

  onLoginPressed(String email, String password) {
    if (!EmailValidator.validate(email)) {}
    if (password.length < 6) {}
  }
}
