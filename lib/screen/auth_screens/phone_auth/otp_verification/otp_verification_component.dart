import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationComponent {
  OTPVerificationComponent();

  Widget getBackButton(onBack) {
    return GestureDetector(
      onTap: onBack,
      child: SvgPicture.asset(
        assets.icBack,
      ),
    );
  }

  Widget getTitle() {
    return Text(
      'Enter OTP',
      style: textStyles.extraBoldGradientMontserrat.copyWith(
        fontSize: 28,
      ),
    );
  }

  Widget getDetailText() {
    return Text(
      'Enter 6-digit OTP code to verify the phone number',
      style: textStyles.regularManrope,
    );
  }

  Widget getPinCodeField(BuildContext context, verificationCodeController) {
    return Form(
      // key: formKey,
      child: PinCodeTextField(
        appContext: context,
        controller: verificationCodeController,
        pastedTextStyle: textStyles.semiBoldManrope.copyWith(
          fontSize: sizes.fontRatio * 28,
        ),
        length: 6,
        obscureText: false,
        // animationType: AnimationType.fade,
        autoFocus: true,
        enablePinAutofill: true,

        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          borderWidth: 1,
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: colors.white,
          inactiveFillColor: colors.white,
          selectedFillColor: colors.white,
          inactiveColor: colors.grey,
          selectedColor: colors.appColor,
          activeColor: colors.appColor,
        ),
        cursorColor: colors.primaryDark,
        animationDuration: Duration(milliseconds: 300),
        textStyle: textStyles.semiBoldManrope.copyWith(
          fontSize: sizes.fontRatio * 28,
        ),
        enableActiveFill: true,
        backgroundColor: colors.white,

        keyboardType: TextInputType.number,

        onCompleted: (v) {
          print("Completed");
        },
        onTap: () {
          print("Pressed");
        },
        onChanged: (value) {
          print(value);
        },

        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }

  Widget getPinTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomTimer(),
        Text(
          " sec",
          style: textStyles.regularManrope.copyWith(
            color: colors.primaryDark,
            fontWeight: FontWeight.w300,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget getResendButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Didn’t Receive the Code? ",
          style: textStyles.regularManrope.copyWith(
            color: colors.primaryDark,
            fontWeight: FontWeight.w300,
            fontSize: 15,
          ),
        ),
        Text(
          'Resend',
          style: textStyles.boldManrope.copyWith(
            color: colors.appColor,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
