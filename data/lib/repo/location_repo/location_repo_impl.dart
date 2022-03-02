import 'dart:convert';

import 'package:data/export.dart';

class LocationRepoImpl implements LocationRepo {
  final NetworkHelper _networkHelper;
  final EndPoints _endPoints;

  LocationRepoImpl(this._networkHelper, this._endPoints);

  @override
  Future<Either<AppError, LocationModel>> saveLocation(
      LocationModel location) async {
    try {
      final response = await _networkHelper.post(
        _endPoints.saveUserLocation(),
        body: location.toJson(),
      );
      if (response.statusCode == 201) {
        var data = json.decode(response.body.toString());
        if (data != null) {
          location = LocationModel.fromJson(
            data['body'],
          );
        }
        return Right(location);
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
  Future<Either<AppError, LocationModel>> updateLocation(int id) {
    // TODO: implement updateLocation
    throw UnimplementedError();
  }
}
