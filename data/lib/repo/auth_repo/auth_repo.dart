import 'package:core/export.dart';
import 'package:data/export.dart';
import 'package:flutter/material.dart';


mixin AuthRepo{
  Future<Either<AppError, AppSuccess>> sendResetPasswordEmail(BuildContext context, String email);

  Future<Either<AppError, AppSuccess>> signInWithFacebook(BuildContext context);

  Future<Either<AppError, AppSuccess>> signInWithGoogle(BuildContext context);

  Future<Either<AppError, AppSuccess>> signInWithFirebase(
      BuildContext context, String email, String password);

  Future<Either<AppError, AppSuccess>> registerUser(
      BuildContext context, String email, String password, String name);

  Future<Either<AppError, AppSuccess>> signOutWithGoogle();


  // Either<AppError, User> getCurrentUser();

  // Future<Either<AppError, dynamic>> signWithPhone(
  //     String number, PhoneAuthView view, UserUseCase userUseCase);
  //
  // Future<Either<AppError, dynamic>> verifyOTP(
  //     String smscode, String verificationId, OTPVerificationView view, UserUseCase userUseCase);
  //
  // Future<Either<AppError, dynamic>> resendOTP(
  //     String number, OTPVerificationView view, UserUseCase userUseCase);

  Future<bool> signOut();

  Future<Either<AppError, AppSuccess>> initializeUser();

  Future<Either<AppError, AppSuccess>> changePassword(
      BuildContext context, String oldPassword, String newPassword, String confirmPassword);

  Future<Either<AppError, AppSuccess>> changeEmail(
      BuildContext context, String newEmail, String currentPassword);

  Future<Either<AppError, AppSuccess>> checkForDisplayName();
}