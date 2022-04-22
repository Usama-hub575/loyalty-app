import 'dart:convert';

import 'package:data/export.dart';

class ReviewRepoImpl implements ReviewRepo {
  final NetworkHelper _networkHelper;
  final EndPoints _endPoints;

  ReviewRepoImpl(this._networkHelper, this._endPoints);

  @override
  Future<Either<AppError, AppSuccess>> submitReview(Review review) async {
    try {
      final response = await _networkHelper.post(
        _endPoints.submitReview(),
        body: review.toJson(),
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body.toString());
        if (data != null) {
          return Right(AppSuccess());
        }
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
}
