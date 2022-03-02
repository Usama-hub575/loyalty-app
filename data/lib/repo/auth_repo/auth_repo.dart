import 'package:data/export.dart';

mixin AuthRepo {
  Future<Either<AppError, AppSuccess>> sendResetPasswordEmail(String email);

  Future<Either<AppError, User>> signInWithFacebook();

  Future<Either<AppError, User>> signInWithGoogle();

  Future<Either<AppError, User>> signInWithFirebase(
      String email, String password);

  Future<Either<AppError, User>> registerUser(
      String email, String password, String name);

  Future<Either<AppError, dynamic>> signWithPhone(
    String number,
    navigateToOTPVerificationPage,
    navigateToTab,
    navigateToRegister,
  );

  Future<Either<AppError, dynamic>> verifyOTP(
    String smsCode,
    String verificationId,
    navigateToRegister,
    navigateToHome,
    getRoute,
  );

  Future<Either<AppError, dynamic>> resendOTP(
    String number,
  );

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
      String oldPassword, String newPassword, String confirmPassword);

  Future<Either<AppError, AppSuccess>> changeEmail(
      String newEmail, String currentPassword);

  Future<Either<AppError, AppSuccess>> checkForDisplayName();

  User? getCurrentUser();

  Future<Either<AppError, UserModel>> isUserRegistered(
      type, String? code, String? number);
}
