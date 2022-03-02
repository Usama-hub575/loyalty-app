import 'package:data/export.dart';

mixin RegisterRepo {
  Future<Either<AppError, UserModel>> registerUser(UserModel user);
  Future<Either<AppError, String>> uploadImageToFireBase(String image);
}
