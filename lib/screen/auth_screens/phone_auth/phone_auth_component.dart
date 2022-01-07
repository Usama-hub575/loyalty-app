import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aactivpay/export.dart';

class PhoneAuthComponent {
  Widget getMobileForm(
          BuildContext context,
          TextEditingController _phoneNumberController,
          Function onTap,
          bool loading,
          Widget floatingActionButton,
          Function onCountryChange,
          int _phoneNumMaxLength) =>
      Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colors.appColor),
              ),
              child: Row(
                children: [
                  inputField(
                    _phoneNumberController,
                    'PHONE_NUMBER_HINT',
                    _phoneNumMaxLength,
                  ),
                ],
              ),
            ),
            SizedBox(height: sizes.mediumPadding),
            Align(
              alignment: Alignment.bottomCenter,
              child: floatingActionButton,
            )
          ],
        ),
      );

  inputField(_phoneNumberController, String hint, int _phoneNumMaxLength) =>
      Expanded(
        child: Container(
          child: TextFormField(
            // style: textStyles..copyWith(
            //   color: colors.colorDarkBlueGray,
            //   fontSize: sizes.fontRatio * 16,
            // ),
            keyboardType: TextInputType.phone,
            controller: _phoneNumberController,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(_phoneNumMaxLength)
            ],
            decoration: InputDecoration(
              hintText: hint,
              // hintStyle: textStyles.regularMedium.copyWith(
              //   color: colors.colorDarkBlueGray.withOpacity(0.5),
              //   fontSize: sizes.fontRatio * 16,
              // ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            validator: (String value) {
              if (value.isEmpty) {}
              return null;
            },
          ),
        ),
      );
}
