import 'dart:async';
import 'package:domain/export.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'export.dart';

class PhoneAuthController extends GetxController
    with StateMixin<PhoneAuthScreen> {
  final AuthUseCase _authUseCase;

  PhoneAuthController(this._authUseCase);

  BuildContext context;
  String errorMessage;
  bool showOnBoardingScenarioTwo;

  void initialize({BuildContext context}) {
    this.context = context;
  }

  verifyPhoneNumber(String number) async {
    // view.showProgressBar();
    await _authUseCase.signInWithPhone(number).then((signInResponse) async {},
        onError: (e) {
      // view.hideProgressBar();
      if (e is PlatformException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }
      // view.showErrorMessage(AppError(title: errorMessage));
    });
  }
}
