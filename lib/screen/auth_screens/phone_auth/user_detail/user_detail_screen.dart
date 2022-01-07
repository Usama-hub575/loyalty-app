import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

import 'export.dart';

class UserDetailScreen extends GetView<UserDetailController> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _globalKey = GlobalKey<ScaffoldState>();
  bool _loading = false;
  bool _disabled = false;

  // AppLocalizations _appLocalizations;
  UserDetailComponent _component = UserDetailComponent();

  _onPressedBack(context) {
    Navigator.of(context).pop();
  }

  _onTap() {
    // presenter.registerUser(context, _firstNameController.text.trim(),
    //     _lastNameController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    bool isPhone = sizes.isPhone;
    // _appLocalizations = AppLocalizations.of(context);
    return Scaffold(
        key: _globalKey,
        floatingActionButton: null,
        backgroundColor: colors.background,
        body: SafeArea(
          top: true,
          child: Stack(
            children: <Widget>[],
          ),
        ));
  }

  navigateToTabsPage() {
    // Navigator.of(_globalKey.currentContext)
    //     .pushNamedAndRemoveUntil(AppRoutes.tabs, (route) => false);
  }

  // showErrorMessage(AppError appError) {
  //   showSnackBarWithGlobalKeyAndAppErrors(_globalKey, appError,
  //       backgroundColor: colors.colorRedCard);
  // }

  showProgressbar() {
    _loading = true;
  }

  hideProgressbar() {
    _loading = false;
  }

  disableFab() {
    _disabled = true;
  }

  @override
  enableFab() {
    _disabled = true;
  }
}
