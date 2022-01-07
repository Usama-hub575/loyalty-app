import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class OTPVerificationComponent {
  OTPVerificationComponent();

  getMobileForm(context, appLocalizations, _smsController, Function onTap, loading, formKey,
          String phoneNumber, Function resend) =>
      SingleChildScrollView(
        child: Container(
          height: sizes.height,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(sizes.width * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Spacer(flex: 2),
              Align(
                alignment: Alignment.centerLeft,
                // child: BasicHeader(
                //   appLocalizations.translate(VERIFY_PHONE_NUMBER_TITLE),
                // ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: sizes.width * 0.025, top: 20),
                child: Text(
                  appLocalizations.translate("VERIFY_PHONE_NUMBER_SUBTITLE"),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: sizes.width * 0.055),
                  child: Text(
                    phoneNumber != null ? phoneNumber : "",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, height: 1.5),
                  ),
                ),
              ),
              getPinCodeFeild(context, onTap, _smsController, resend),
              const Spacer(flex: 8),
            ],
          ),
        ),
      );

  getAuthBackButton(f) => Align(
        alignment: Alignment.topLeft,
        child: BackButton(
          color: colors.appColor,
          onPressed: f,
        ),
      );

  getPinCodeFeild(BuildContext context, Function onTap, smsController, Function resend) {
    return Container(
      height: MediaQuery.of(context).size.height - 400,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        shrinkWrap: false,
        primary: false,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Form(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                child: Container()),
          ),
          SizedBox(
            height: 6,
          ),
          Text("Trying to auto-fetch the code...",
              style: TextStyle(
                  color: colors.appColor, fontWeight: FontWeight.normal, fontSize: 16)),
          SizedBox(
            height: 80,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              child: Container(
                height: 30,
                child: Row(
                  children: [
                    Text(
                      "Resend code | ",
                      style: TextStyle(
                          color: colors.appColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    CustomTimer(resend: resend),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
