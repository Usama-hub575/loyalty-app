import 'package:core/export.dart';
import 'package:data/export.dart';
import 'package:flutter/material.dart';

class AuthUseCase{
   final FirebaseAuthWrapper auth;
   final AuthRepo repo;

  AuthUseCase(this.auth, this.repo);

  Future<Either<AppError, AppSuccess>> sendResetPasswordEmail(
      BuildContext context, String email) async {
    return await repo.sendResetPasswordEmail(context, email);
  }

  Future<Either<AppError, AppSuccess>> registerUser(
      BuildContext context, String email, String password, String name) async {
    return await repo.registerUser(context, email, password, name);
  }

  Future<Either<AppError, AppSuccess>> signInWithFaceBook(
      BuildContext context) async {
    return await repo.signInWithFacebook(context);
  }

  Future<Either<AppError, AppSuccess>> signInWithGoogle(
      BuildContext context) async {
    await repo.signOutWithGoogle();
    return await repo.signInWithGoogle(context);
  }

  Future<Either<AppError, AppSuccess>> signInWithFirebase(
      BuildContext context, String email, String password) async {
    return await repo.signInWithFirebase(context, email, password);
  }

  // Future<bool> isUserLoggedIn() async {
    // User user = auth.firebaseAuth().currentUser;
    // return user != null;
  // }
}