import 'package:domain/export.dart';

class AuthUseCase {
  final FirebaseAuthWrapper auth;
  final AuthRepo repo;
  final SharedPreferences sharedPreferences;
  final RegisterUseCase registerUseCase;

  AuthUseCase(
    this.auth,
    this.repo,
    this.sharedPreferences,
    this.registerUseCase,
  );

  Future<Either<AppError, AppSuccess>> sendResetPasswordEmail(
      String email) async {
    return await repo.sendResetPasswordEmail(email);
  }

  Future<Either<AppError, bool>> isUserRegistered(
      String type, String? code, String? number) async {
    final either = await repo.isUserRegistered(type, code, number);
    return either.fold((error) {
      return Left(AppError(title: 'user not registered'));
    }, (user) {
      if (user.jwt.isNotEmpty) {
        sharedPreferences.setString('jwt', user.jwt);
        registerUseCase.setUser(user);
        return const Right(true);
      } else {
        return const Right(false);
      }
    });
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

  Future<Either<AppError, dynamic>> signInWithPhone(
    String number,
    navigateToOTPVerificationPage,
    navigateToHome,
    navigateToRegister,
  ) async {
    return await repo.signWithPhone(
      number,
      navigateToOTPVerificationPage,
      navigateToHome,
      navigateToRegister,
    );
  }

  Future<Either<AppError, dynamic>> verifyOTP(
    String smsCode,
    String verificationId,
    navigateToRegister,
    navigateToHome,
  ) async {
    return await repo.verifyOTP(
      smsCode,
      verificationId,
      navigateToRegister,
      navigateToHome,
      getRoute,
    );
  }

  Future<Either<AppError, dynamic>> resendOTP(
    String number,
  ) async {
    return await repo.resendOTP(
      number,
    );
  }

  Future<void> getRoute(
    openLoginPage,
    openRegisterPage,
    openHomePage,
  ) async {
    User? user = repo.getCurrentUser();
    if (user == null) {
      openLoginPage();
    } else {
      var response = await isUserRegistered(
        'CUSTOMER',
        getCode(user.phoneNumber),
        getNumber(user.phoneNumber),
      );
      response.fold((left) {
        openRegisterPage(user.phoneNumber);
      }, (right) {
        if (right) {
          openHomePage();
        } else {
          openRegisterPage(user.phoneNumber);
        }
      });
    }
  }

  String? getCode(String? phoneNumber) {
    return phoneNumber?.substring(0, 3);
  }

  String? getNumber(String? phoneNumber) {
    return phoneNumber?.substring(3);
  }
}
