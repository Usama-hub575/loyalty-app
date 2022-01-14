import 'dart:async';
import 'package:aactivpay/export.dart';
import 'package:domain/export.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'export.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class PhoneAuthController extends GetxController
    with StateMixin<PhoneAuthScreen> {
  final AuthUseCase _authUseCase;

  PhoneAuthController(this._authUseCase);

  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  PhoneAuthComponent component = PhoneAuthComponent();
  Rx<bool> isError = false.obs;
  Rx<bool> disabled = true.obs;
  String countryCode = '+92';
  int phoneNumMaxLength = 10;

  // TwilioFlutter twilioFlutter;

  void initialize() {
    _initListener();
    // twilioFlutter = TwilioFlutter(
    //   twilioNumber: '+923004046580',
    //   accountSid: 'AC686608367a46f88d1bb749b3bc82d5a3',
    //   authToken: '252c38c43408b43d2474b23d77a7adb0',
    // );
  }

  _initListener() {
    phoneNumberController.value.addListener(() {
      if (phoneNumberController.value.text.length >= phoneNumMaxLength) {
        disabled.value = false;
      } else {
        disabled.value = true;
      }
    });
  }

  navigateToOTPVerificationPage(String _verificationId) async {
    AppRoutes.appRoutes(RouteNames.otpScreen);
  }

  void onContinueTap() {
    if (!validateNumber(phoneNumberController.value.text)) {
      isError.value = true;
    } else {
      isError.value = false;
      navigateToOTPVerificationPage('_verificationId');
      // sendSms();
      if (phoneNumberController.value == null ||
          phoneNumberController.value.text.length > phoneNumMaxLength) {
        // showSnackBarWithGlobalKeyAndAppErrors(
        //     widget.globalKey, AppError(title: ERROR_INVALID_PHONE_NUMBER),
        //     backgroundColor: colors.colorRedCard);
      }
    }
  }

  Future showErrorMessage(appError) async {
    // showSnackBarWithGlobalKeyAndAppErrors(widget.globalKey, appError,
    //     backgroundColor: colors.colorRedCard);
  }

  void sendSms() async {
    // await twilioFlutter.sendSMS(
    //     toNumber: '+923109276680',
    //     messageBody: 'Hii everyone this is a demo of\nflutter twilio sms.');
  }

  bool validateNumber(String text) {
    return (text.length >= 10 && text[0] == '3');
  }
}
