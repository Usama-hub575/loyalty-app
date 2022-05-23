import 'dart:convert';

import 'package:data/export.dart';

class AllStoresRepoImpl implements AllStoresRepo{
  final NetworkHelper _networkHelper;
  final EndPoints _endPoints;

  AllStoresRepoImpl(this._networkHelper, this._endPoints);

  @override
  Future<Either<AppError, StoresList>> getAllStores() async{
    try {
      final response = await _networkHelper.get(
        _endPoints.getAllStores(),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body.toString());
        return Right(StoresList.fromJson(data));
      }
      return Left(
        AppError(),
      );
    } catch (e) {
      return Left(
        AppError(title: e.toString()),
      );
    }
    // TODO: implement getAllStores
    throw UnimplementedError();
  }
}