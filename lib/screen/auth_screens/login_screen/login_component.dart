import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class LoginComponent {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginComponent(this.emailController, this.passwordController);

  getSignInText() {
    return Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 40,
        color: colors.primaryDark,
      ),
    );
  }

  getEmailField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Email/Number",
          border: InputBorder.none,
        ),
      ),
    );
  }

  getPasswordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Password",
          border: InputBorder.none,
        ),
      ),
    );
  }

  getForgetPasswordButton(onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 16,
              color: colors.primaryDark,
            ),
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }

  getSignInButton(onPressed) {
    return Center(
      child: ElevatedButton(
        child: Text(
          'Signin',
          style: TextStyle(
            fontSize: 20,
            color: colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colors.black),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
        ),
        onPressed: onPressed,
      ),
    );
  }

  getRegisterButton(onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: TextStyle(
            fontSize: 16,
            color: colors.primaryDark,
          ),
        ),
        TextButton(
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 18,
              color: colors.primaryDark,
              fontWeight: FontWeight.w800
            ),
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }

}
