import 'package:domain/export.dart';

class RegisterUseCase {
  final RegisterRepo repo;

  RegisterUseCase(this.repo);

  UserModel _user = UserModel();

  Future<Either<AppError, AppSuccess>> registerUser(UserModel user) async {
    final either = await repo.registerUser(user);
    return either.fold((error) {
      return Left(AppError());
    }, (user) {
      _user = user;
      return Right(AppSuccess());
    });
  }

  Future<String> uploadImage(String image) async {
    final either = await repo.uploadImageToFireBase(image);
    return either.fold((error) {
      return '';
    }, (link) {
      return link;
    });
  }

  UserModel get user => _user;

  setUser(data) {
    _user = data;
  }
}
