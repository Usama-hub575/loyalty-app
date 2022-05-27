import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {
  final BuildContext context;
  final TextEditingController verificationCodeController;
  final Function onComplete, validateOTP;

  const PinCodeField(
    this.context,
    this.verificationCodeController,
    this.onComplete,
    this.validateOTP,
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      child: GetX<OTPVerificationController>(
        builder: (controller) {
          return Focus(
            onFocusChange: (hasFocus) {
              controller.isFocus.value = hasFocus;
            },
            child: PinCodeTextField(
              appContext: context,
              controller: verificationCodeController,
              pastedTextStyle: textStyles.bodyLarge,
              length: 6,
              obscureText: false,
              // animationType: AnimationType.fade,
              autoFocus: true,
              enablePinAutofill: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                borderWidth: 0,
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: colors.white,
                inactiveFillColor: colors.white,
                selectedFillColor: colors.white,
                inactiveColor: colors.primaryDark.withOpacity(0.05),
                selectedColor: controller.isFocus.value
                    ? colors.accentPrimary
                    : colors.white,
                activeColor: controller.isFocus.value
                    ? colors.accentPrimary
                    : colors.white,
              ),
              hintCharacter: '-',
              hintStyle: textStyles.bodyLarge,
              cursorColor: colors.primaryDark,
              animationType: AnimationType.fade,
              textStyle: textStyles.bodyLarge,
              enableActiveFill: true,
              backgroundColor: colors.primaryLight,

              keyboardType: TextInputType.number,

              onCompleted: (v) {
                print("Completed");

                onComplete();
              },
              onTap: () {
                print("Pressed");
              },
              onChanged: (value) {
                validateOTP();
              },

              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),
          );
        },
      ),
    );
  }
}
