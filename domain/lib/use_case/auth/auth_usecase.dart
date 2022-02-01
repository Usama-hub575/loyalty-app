import 'package:data/export.dart';

class AuthUseCase {
  final FirebaseAuthWrapper auth;
  final AuthRepo repo;

  AuthUseCase(this.auth, this.repo);

  Future<Either<AppError, AppSuccess>> sendResetPasswordEmail(
      String email) async {
    return await repo.sendResetPasswordEmail(email);
  }

  Future<Either<AppError, User>> registerUser(
      String email, String password, String name) async {
    return await repo.registerUser(email, password, name);
  }

  Future<Either<AppError, User>> signInWithFaceBook() async {
    return await repo.signInWithFacebook();
  }

  Future<Either<AppError, User>> signInWithGoogle() async {
    await repo.signOutWithGoogle();
    return await repo.signInWithGoogle();
  }

  Future<Either<AppError, User>> signInWithFirebase(
      String email, String password) async {
    return await repo.signInWithFirebase(email, password);
  }

  Future<Either<AppError, dynamic>> signInWithPhone(String number) async {
    return await repo.signWithPhone(number);
  }

  Future<Either<AppError, dynamic>> verifyOTP(
      String smsCode, String verificationId) async {
    return await repo.verifyOTP(smsCode, verificationId);
  }

  Future<Either<AppError, dynamic>> resendOTP(String number) async {
    return await repo.signWithPhone(number);
  }

// Future<bool> isUserLoggedIn() async {
// User user = auth.firebaseAuth().currentUser;
// return user != null;
//

}
