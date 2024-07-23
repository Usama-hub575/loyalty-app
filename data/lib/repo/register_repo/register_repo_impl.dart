import 'dart:convert';
import 'dart:io';
import 'package:data/export.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RegisterRepoImpl implements RegisterRepo {
  final NetworkHelper _networkHelper;
  final EndPoints _endPoints;

  RegisterRepoImpl(this._networkHelper, this._endPoints);

  @override
  Future<Either<AppError, UserModel>> registerUser(UserModel user) async {
    try {
      final response = await _networkHelper.post(
        _endPoints.registerUser(),
        body: user.toJson(),
      );
      if (response.statusCode == 201) {
        user = UserModel.fromJson(
          json.decode(response.body.toString()),
        );
        return Right(user);
      }
      return Left(
        AppError(),
      );
    } catch (e) {
      return Left(
        AppError(title: e.toString()),
      );
    }
  }

  @override
  Future<Either<AppError, String>> uploadImageToFireBase(String image) async {
    File file = File(image);
    try {
      firebase_storage.TaskSnapshot uploadTask = await firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child(file.path.split("/").last)
          .putFile(file);
      String? url = await uploadTask.ref.getDownloadURL();
      return Right(url);
    } on FirebaseException catch (e) {
      return Left(AppError(title: e.code, description: e.message.toString()));
    }
  }
}
