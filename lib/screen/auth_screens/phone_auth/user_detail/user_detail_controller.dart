import 'package:domain/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'export.dart';

class UserDetailController extends GetxController
    with StateMixin<UserDetailScreen> {
  final AuthUseCase _authUseCase;
  bool showOnBoardingScenarioTwo;

  UserDetailController(this._authUseCase);

  void initialize({BuildContext context}) {}

  registerUser(BuildContext context, String firstName, String lastName) {
    if (firstName.isEmpty) {
      // view.showErrorMessage(AppError(title: ENTER_FIRST_NAME));
    } else if (lastName.isEmpty) {
      // view.showErrorMessage(AppError(title: ENTER_LAST_NAME));
    } else {
      // view.showProgressbar();
      // _authUseCase.updateName(firstName, lastName).then((response) async {
      //   response.fold((appError) {
          // view.hideProgressbar();
          // view.showErrorMessage(appError);
        // }, (appSuccess) async {
          // view.disableFab();
            // view.hideProgressbar();
          // });

          // view.navigateToTabsPage();
        // });
      }
    // onError: (e) {
    //     // view.hideProgressbar();
    //     String errorMessage;
    //     if (e is PlatformException) {
    //       errorMessage = e.message;
    //     } else {
    //       errorMessage = e.toString();
    //     }
    //     // view.showErrorMessage(AppError(description: errorMessage));
    //   });
    }
  }




