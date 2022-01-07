import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class UserDetailComponent {
  final _formKey = GlobalKey<FormState>();

  Widget getTabletForm(
          BuildContext context,
          TextEditingController firstNameController,
          TextEditingController lastNameController,
          Function onTap,
          bool loading,
          Widget floatingActionButton) =>
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: sizes.tabletLargeOuterMargin,
            vertical: sizes.tabletPagePadding),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sizes.pagePadding),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(sizes.pagePadding),
              border: Border.all(width: 1, color: colors.appColor)),
          padding: EdgeInsets.only(
              left: sizes.tabletPagePadding,
              right: sizes.tabletPagePadding,
              top: sizes.tabletPagePadding,
              bottom: sizes.largerPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: BasicHeader(
              //     translate(context, WELCOME_TO),
              //   ),
              // ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: sizes.regularPadding, bottom: sizes.largerPadding),
                  child: Text(
                    '  AppLocalizations.of(context.translate(WELCOME_COMMENT_USER_DETAIL)',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: colors.black),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // inputField(
                    //     firstNameController,
                    //     translate(context, FIRST_NAME),
                    //     translate(context, FIRST_NAME),
                    //     loading),
                    SizedBox(height: sizes.pagePadding),
                    // inputField(
                    //     lastNameController,
                    //     translate(context, LAST_NAME),
                    //     translate(context, LAST_NAME),
                    //     loading),
                    SizedBox(height: sizes.pagePadding),
                  ],
                ),
              ),
              SizedBox(height: sizes.pagePadding),
              Align(
                alignment: Alignment.centerRight,
                child: floatingActionButton,
              )
            ],
          ),
        ),
      );

  Widget getMobileForm(
          BuildContext context,
          TextEditingController firstNameController,
          TextEditingController lastNameController,
          Function onTap,
          bool loading) =>
      SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 2 * sizes.extraLargePadding),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: BasicHeader(
                //     AppLocalizations.of(context).translate(WELCOME_TO),
                //   ),
                // ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 30),
                    child: Text(
                      'AppLocalizations.of(context).translate(WELCOME_COMMENT_USER_DETAIL)',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, height: 1.5),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 16),
                      // inputField(
                      //     firstNameController,
                      //     AppLocalizations.of(context).translate(FIRST_NAME),
                      //     AppLocalizations.of(context).translate(FIRST_NAME),
                      //     loading),
                      const SizedBox(height: 16),
                      // inputField(
                      //     lastNameController,
                      //     AppLocalizations.of(context).translate(LAST_NAME),
                      //     AppLocalizations.of(context).translate(LAST_NAME),
                      //     loading),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  inputField(emailController, label, errorLabel, readOnly) => TextFormField(
        readOnly: readOnly,
        controller: emailController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        // decoration: myInputDecoration(label, '', null, false),
      );
}
