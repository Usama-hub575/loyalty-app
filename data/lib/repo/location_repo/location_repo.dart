import 'package:data/export.dart';

mixin LocationRepo {
  Future<Either<AppError, LocationModel>> saveLocation(LocationModel location);
  Future<Either<AppError, LocationModel>> updateLocation(int id);
}
