import 'dart:async';

import 'package:domain/export.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

import 'export.dart';

class OTPVerificationController extends GetxController with StateMixin<OTPVerificationScreen> {
  OTPVerificationController(this._authUseCase,);

  final AuthUseCase _authUseCase;
  
  String errorMessage = "";

  void initialize({BuildContext context}) {
  }

  void verifyCode(String code, String verificationId) async {
    final result =
    _authUseCase.verifyOTP(code, verificationId,);
    result.then((value) {}, onError: (e) {
      if (e is PlatformException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }
      // view.showErrorMessage(AppError(title: errorMessage));
    });
  }

  resendOTP(String number) async {
    await _authUseCase
        .resendOTP(number)
        .then((signInResponse) async {}, onError: (e) {
      if (e is PlatformException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }
      // view.showErrorMessage(AppError(title: errorMessage));
    });
  }

}
