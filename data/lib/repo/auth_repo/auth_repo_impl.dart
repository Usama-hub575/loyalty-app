import 'package:data/export.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuthWrapper _auth;
  final FacebookLogin _facebookLogin;

  AuthRepoImpl(this._googleSignIn, this._auth, this._facebookLogin);

  @override
  Future<Either<AppError, User>> registerUser(
      String email, String password, String name) async {
    try {
      final result = await _auth
          .firebaseAuth()
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if (user == null) {
        return Left(AppError(title: 'USER_NOT_FOUND'));
      } else if (user.email == null) {
        return Left(AppError(title: 'EMAIL_ID_NOT_FOUND'));
      } else if (user.isAnonymous) {
        return Left(AppError(title: 'USER_ANONYMOUS'));
      }
      if (!user.emailVerified) {
        await user.sendEmailVerification();
        return Left(AppError(title: 'VERIFY_EMAIL'));
      } else {
        // signInWithFirebase(email, password);
        return Right(user);
      }
    } catch (e) {
      if (e is PlatformException) {
        return Left(
            AppError(description: 'error_in_registering_user', title: e.code));
      }
      return Left(AppError(
          description: 'error_in_registering_user', title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, User>> signInWithFirebase(
      String email, String password) async {
    try {
      final result = await _auth
          .firebaseAuth()
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if (user == null) {
        return Left(AppError(title: 'USER_NOT_FIND'));
      } else if (!user.emailVerified) {
        user.sendEmailVerification();
        return Left(AppError(title: 'VERIFY_EMAIL'));
      } else {
        return Right(user);
      }
    } catch (error) {
      return Left(AppError(
        title: 'error_in_signing_in_user_with_email',
        description: error.toString(),
      ));
    }
  }

  @override
  Future<Either<AppError, AppSuccess>> sendResetPasswordEmail(
      String email) async {
    if (email.isEmpty) {
      return Left(AppError(
        title: 'ENTER_EMAIL',
      ));
    }

    if (!EmailValidator.validate(email)) {
      return Left(AppError(
        title: 'ENTER_VALID_EMAIL',
      ));
    }

    try {
      await _auth.firebaseAuth().sendPasswordResetEmail(email: email);
      return Right(AppSuccess());
    } catch (error) {
      AppError appError;
      if (error is PlatformException) {
        appError = getLoggedError('error_in_sending_password_reset_email',
            title: error.code, description: error.message ?? '');
      } else {
        appError = getLoggedError('error_in_sending_password_reset_email',
            title: 'EXCEPTION', description: error.toString());
      }
      return Left(appError);
    }
  }

  @override
  Future<Either<AppError, User>> signInWithFacebook() async {
    try {
      _facebookLogin.loginBehavior = FacebookLoginBehavior.nativeWithFallback;
      var facebookLoginResult = await _facebookLogin.logIn(['email']);
      switch (facebookLoginResult.status) {
        case FacebookLoginStatus.error:
          if (facebookLoginResult.errorMessage ==
              "net::ERR_INTERNET_DISCONNECTED") {
            return Left(
              getLoggedError('error_in_signing_in_user_with_facebook',
                  title: 'ERROR_NETWORK_REQUEST_FAILED'),
            );
          } else {
            return Left(getLoggedError('error_in_signing_in_user_with_facebook',
                title: "FACEBOOK_LOGIN_ERROR",
                description: facebookLoginResult.errorMessage));
          }
        case FacebookLoginStatus.cancelledByUser:
          return Left(getLoggedError(
            'error_in_signing_in_user_with_facebook',
            title: 'CANCELLED_BY_USER',
          ));
        case FacebookLoginStatus.loggedIn:
          final token = facebookLoginResult.accessToken.token;
          // final graphResponse = await _network.get(
          //     'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name'
          //     ',picture,email&access_token=$token');
          // return graphResponse.fold((failure) {
          //   return Left(failure);
          // }, (response) async {
          //   final profile = _jsonConverter.fromJson(response.body);
          //
          final AuthCredential credential =
              FacebookAuthProvider.credential(token);
          final User? user =
              (await _auth.firebaseAuth().signInWithCredential(credential))
                  .user;
          if (user == null) {
            return Left(getLoggedError('error_in_signing_in_user_with_facebook',
                title: 'USER_NOT_FOUND'));
          } else if (user.isAnonymous) {
            return Left(getLoggedError('error_in_signing_in_user_with_facebook',
                title: 'USER_ANONYMOUS'));
          }

          // final User? currentUser = _auth.firebaseAuth().currentUser;

          // if (user.providerData[0].email == null) {
          //   return Left(getLoggedError("error_in_signing_in_user_with_facebook",
          //       title: "EMAIL_ID_NOT_FOUND"));
          // }
          if (user.displayName == null) {
            return Left(getLoggedError('error_in_signing_in_user_with_facebook',
                title: 'NAME_NOT_FOUND'));
          }
          return Right(user);
      }
    } catch (error) {
      AppError appError = _getAppErrorFromException(error);
      return Left(appError);
    }
    return Left(getLoggedError('error_in_signing_in_user_with_facebook',
        title: 'AUTH_CONN_ERROR'));
  }

  @override
  Future<Either<AppError, User>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return Left(AppError(
          title: 'CANCELLED_BY_USER',
          description: 'error_in_signing_in_user_with_gmail',
        ));
      }
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
          await _auth.firebaseAuth().signInWithCredential(credential);
      final User? user = authResult.user;
      if (user == null) {
        return Left(AppError(
          title: 'USER_NOT_AVAILABLE',
          description: 'error_in_signing_in_user_with_gmail',
        ));
      }
      if (user.isAnonymous) {
        return Left(AppError(
          title: 'USER_ANONYMOUS',
          description: 'error_in_signing_in_user_with_gmail',
        ));
      }
      if (user.displayName == null) {
        return Left(AppError(
          title: 'NAME_NOT_FOUND',
          description: 'error_in_signing_in_user_with_gmail',
        ));
      }
      return Right(user);
    } catch (error) {
      return Left(AppError(title: error.toString()));
    }
  }

  @override
  Future<Either<AppError, dynamic>> signWithPhone(String number) async {
    return Left(AppError());
    //
    //   // PhoneVerificationCompleted verificationCompleted =
    //   //     (PhoneAuthCredential phoneAuthCredential) async {
    //   //   final value = await _auth.firebaseAuth().signInWithCredential(phoneAuthCredential);
    //   //   if (value.user != null) {
    //   //     view.showAutoVerifyMessage(view.getTextFromKey(PHONE_NUMBER_OTP_AUTO_VERIFY_SUCCESSFUL));
    //   //     view.hideProgressBar();
    //   //     final res = await checkForDisplayName();
    //   //     userUseCase.setupUserOnboarding();
    //   //     Future.delayed(Duration(seconds: 1));
    //   //     if (res.isRight()) {
    //   //       /// user name is present
    //   //       if (userModel.data.grade == null)
    //   //         view.navigateToOnBoarding();
    //   //       else
    //   //         view.navigateToTabsPage();
    //   //     } else {
    //   //       /// username is not available
    //   //       view.navigateToUserDetailPage();
    //   //     }
    //   //   }
    //   // };
    //
    //   PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) {
    //     view.hideProgressBar();
    //     view.showErrorMessage(AppError(title: FAILED_PHONE_NUMBER_AUTHENTICATION));
    //   };
    //
    //   PhoneCodeSent codeSent = (String verificationId, [int forceResendingToken]) {
    //     view.hideProgressBar();
    //     Future.delayed(Duration(seconds: 1));
    //     view.navigateToOTPVerificationPage(verificationId);
    //   };
    //
    //   PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
    //     view.hideProgressBar();
    //     Future.delayed(Duration(seconds: 1));
    //   };
    //
    //   try {
    //     await _auth.firebaseAuth().verifyPhoneNumber(
    //         phoneNumber: number,
    //         verificationCompleted: verificationCompleted,
    //         verificationFailed: verificationFailed,
    //         codeSent: codeSent,
    //         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    //   } catch (e) {
    //     return Left(AppError(title: e.toString()));
    //   }
  }

  @override
  Future<Either<AppError, dynamic>> verifyOTP(
      String smsCode, String verificationId) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      User? _user =
          (await _auth.firebaseAuth().signInWithCredential(credential)).user;
      if (_user != null) {
        // await view.showOTPVerifySuccessMessage(
        //     view.getTextFromKey(OTP_VERIFY_SUCCESS));

        /// success now check for user name
        final value = await checkForDisplayName();
        // userUseCase.setupUserOnboarding();
        Future.delayed(Duration(seconds: 1));
        if (value.isRight()) {
          // view.navigateToTabsPage();
        } else {
          /// username is not available
          // view.navigateToUserDetailPage();
        }
      } else {
        // view.showErrorMessage(AppError(title: ERROR_INVALID_OTP));
      }
      //remove it
      return Left(AppError(title: 'e.toString()'));
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, dynamic>> resendOTP(
    String number,
  ) async {
    // PhoneVerificationCompleted verificationCompleted =
    //     (PhoneAuthCredential phoneAuthCredential) async {
    //   final value =
    //       await _auth.firebaseAuth().signInWithCredential(phoneAuthCredential);
    //   if (value.user != null) {
    //     view.showAutoVerifyMessage(
    //         view.getTextFromKey(PHONE_NUMBER_OTP_AUTO_VERIFY_SUCCESSFUL));
    //     final res = await checkForDisplayName();
    //     userUseCase.setupUserOnboarding();
    //     Future.delayed(Duration(seconds: 1));
    //     if (res.isRight()) {
    //       /// user name is present
    //       if (userModel.data.grade == null)
    //         view.navigateToOnBoarding();
    //       else
    //         view.navigateToTabsPage();
    //     } else {
    //       /// username is not available
    //       view.navigateToUserDetailPage();
    //     }
    // };

    // PhoneVerificationFailed verificationFailed =
    //     (FirebaseAuthException authException) {
    //   view.showErrorMessage(
    //       AppError(title: FAILED_PHONE_NUMBER_AUTHENTICATION));
    // };
    //
    // PhoneCodeSent codeSent =
    //     (String verificationId, [int forceResendingToken]) {
    //   view.showOTPResendMessage(OTP_CODE_RESEND_SUCCESS);
    // };

    // PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
    //     (String verificationId) {};

    try {
      // await _auth.firebaseAuth().verifyPhoneNumber(
      //     phoneNumber: number,
      //     verificationCompleted: verificationCompleted,
      //     verificationFailed: verificationFailed,
      //     codeSent: codeSent,
      //     codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

      //remove it
      return Left(AppError());
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, AppSuccess>> signOutWithGoogle() {
    // TODO: implement signOutWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> changeEmail(
      String newEmail, String currentPassword) {
    // TODO: implement changeEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> changePassword(
      String oldPassword, String newPassword, String confirmPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> checkForDisplayName() {
    // TODO: implement checkForDisplayName
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> initializeUser() {
    // TODO: implement initializeUser
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  String getTitleFromErrorCode(String code) {
    switch (code) {
      case 'invalid-email':
      case 'wrong-password':
      case 'user-not-found':
      case 'user-disabled':
      case 'too-many-requests':
      case 'operation-not-allowed':
      case 'email-already-in-use':
        return code;
      default:
        return 'UNDEFINED_ERROR';
    }
  }

  AppError _getAppErrorFromException(error) {
    print('googleSignInAccount error - $error');
    if (error is PlatformException || error is FirebaseAuthException) {
      String message;
      if (error.message ==
          "com.google.android.gms.common.api.ApiException: 7: ") {
        message = 'ERROR_NETWORK_REQUEST_FAILED';
      } else if (error.code == "ERROR_USER_NOT_FOUND" ||
          error.code == "user-not-found") {
        message = 'EMAIL_NOT_REGISTERED';
      } else {
        message = error.message;
      }
      return AppError(title: error.code, description: message);
    }
    return AppError(title: 'EXCEPTION', description: error.toString());
  }
}
