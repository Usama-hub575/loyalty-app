import 'dart:async';

import 'package:aactivpay/export.dart';
import 'package:domain/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_countdown_timer/index.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class OTPVerificationController extends GetxController
    with StateMixin<OTPVerificationScreen> {
  OTPVerificationController(this._authUseCase);

  final AuthUseCase _authUseCase;

  final verificationCodeController = TextEditingController();

  String errorMessage = "";
  var isButtonActive = false.obs;
  var isResendActive = false.obs;
  var seconds = 60.obs;
  Rx<bool> isLoading = false.obs;
  VerificationModel params;
  CountdownTimerController timerController;

  Rx<bool> isFocus = false.obs;

  void initialize() {
    params = Get.arguments;
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * seconds.value;
    timerController = CountdownTimerController(
      endTime: endTime,
      onEnd: onTimeComplete,
    );
  }

  onBack() {
    Get.back();
  }


  Future<void> verifyCode(String code, String verificationId) async {
    final result = await _authUseCase.verifyOTP(
      code,
      verificationId,
      navigateToRegister,
      navigateToHome,
    );
    result.fold(
        (left) => {
              if (left is PlatformException)
                {
                  errorMessage = left.title,
                  showToast(message: left.title),
                }
              else
                {
                  errorMessage = left.toString(),
                  showToast(message: left.title),
                }
            },
        (right) => null);
  }

  resend() async{
    if (params.number == null) {
      final response  = await _authUseCase.resendOTP(params.number);
      response.fold((l) => showToast(message: l.title.toString()), (r) => response);
      //   showSnackBarWithGlobalKeyAndAppErrors(
      //       _globalKey, AppError(title: ERROR_INVALID_PHONE_NUMBER),
      //       backgroundColor: colors.colorRedCard);
      // } else if (!_loading) {
      //   final result = controller.resendOTP(widget.phoneNumber);
    }
  }

  showErrorMessage(AppError message) {
    //   showSnackBarWithGlobalKeyAndAppErrors(_globalKey, message,
    //       backgroundColor: colors.colorRedCard);
  }

  showOTPResendMessage(String key) {
    // showSnackBar(_globalKey, key, backgroundColor: colors.appColor);
  }

  showAutoVerifyMessage(String msg) async {
    // showSnackBar(_globalKey, msg, backgroundColor: colors.colorGreenCard);
  }

  showOTPVerifySuccessMessage(String msg) async {
    // showSnackBar(_globalKey, msg, backgroundColor: colors.colorGreenCard);
  }

  onConfirmTap() async {
    isOTPValid();
    isLoading.value = true;
    await verifyCode(
        verificationCodeController.value.text, params.verificationId);
    isLoading.value = false;

    // navigateToUserDetailPage();
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
    resend();
  }

  navigateToRegister(number) {
    AppRoutes.appRoutes(RouteNames.registerScreen, arg: [
      constants.registration,
      params.number ?? number,
      constants.register,
    ]);
  }

  navigateToHome() {
    _authUseCase.sharedPreferences.setBool(constants.isLogin, true);
    AppRoutes.appRoutes(RouteNames.homeScreen);
  }
}
