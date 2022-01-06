import 'package:core/export.dart';
import 'package:data/export.dart';
import 'package:flutter/material.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  @override
  Future<Either<AppError, AppSuccess>> registerUser(BuildContext context, String email, String password, String name) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> sendResetPasswordEmail(BuildContext context, String email) {
    // TODO: implement sendResetPasswordEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> signInWithFacebook(BuildContext context) {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> signInWithFirebase(BuildContext context, String email, String password) {
    // TODO: implement signInWithFirebase
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> signInWithGoogle(BuildContext context) {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> signOutWithGoogle() {
    // TODO: implement signOutWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> changeEmail(BuildContext context, String newEmail, String currentPassword) {
    // TODO: implement changeEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppSuccess>> changePassword(BuildContext context, String oldPassword, String newPassword, String confirmPassword) {
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

}