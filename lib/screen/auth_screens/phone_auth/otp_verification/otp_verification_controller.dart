import 'dart:async';

import 'package:aactivpay/export.dart';
import 'package:domain/export.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_countdown_timer/index.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class OTPVerificationController extends GetxController
    with StateMixin<OTPVerificationScreen> {
  OTPVerificationController(
    this._authUseCase,
  );

  final AuthUseCase _authUseCase;

  final verificationCodeController = TextEditingController();

  String errorMessage = "";
  var isButtonActive = false.obs;
  var isResendActive = false.obs;
  var seconds = 60.obs;
  Rx<bool> isLoading = false.obs;
  String phoneNumber;
  CountdownTimerController timerController;

  void initialize() {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * seconds.value;

    timerController = CountdownTimerController(
      endTime: endTime,
      onEnd: onTimeComplete,
    );
  }

  onBack() {
    Get.back();
  }

  void verifyCode(String code, String verificationId) async {
    final result = _authUseCase.verifyOTP(
      code,
      verificationId,
    );
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
    await _authUseCase.resendOTP(number).then((signInResponse) async {},
        onError: (e) {
      if (e is PlatformException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }
      // view.showErrorMessage(AppError(title: errorMessage));
    });
  }

  resend() {
    if (phoneNumber == null) {
      //   showSnackBarWithGlobalKeyAndAppErrors(
      //       _globalKey, AppError(title: ERROR_INVALID_PHONE_NUMBER),
      //       backgroundColor: colors.colorRedCard);
      // } else if (!_loading) {
      //   final result = controller.resendOTP(widget.phoneNumber);
    }
  }

  navigateToTabsPage() {
    // Navigator.of(_globalKey.currentContext)
    //     .pushReplacementNamed(AppRoutes.tabs);
  }

  //
  // showErrorMessage(AppError message) {
  //   showSnackBarWithGlobalKeyAndAppErrors(_globalKey, message,
  //       backgroundColor: colors.colorRedCard);
  // }

  showOTPResendMessage(String key) {
    // showSnackBar(_globalKey, key, backgroundColor: colors.appColor);
  }

  showAutoVerifyMessage(String msg) async {
    // showSnackBar(_globalKey, msg, backgroundColor: colors.colorGreenCard);
  }

  showOTPVerifySuccessMessage(String msg) async {
    // showSnackBar(_globalKey, msg, backgroundColor: colors.colorGreenCard);
  }

  onConfirmTap() {
    // verifyCode(_smsController.value.text, verificationId);
    isOTPValid();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2)).then((value) {
      isLoading.value = false;
      navigateToUserDetailPage();
    });
  }

  void isOTPValid() {
    isButtonActive.value = verificationCodeController.text.length == 6;
  }

  void onTimeComplete() {
    isResendActive.value = true;
  }

  void onResend() {
    isResendActive.value = false;
    seconds.value += 60;
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * seconds.value;

    timerController =
        CountdownTimerController(endTime: endTime, onEnd: onTimeComplete);
  }

  navigateToUserDetailPage() {
    AppRoutes.appRoutes(RouteNames.registerScreen);
  }
}
