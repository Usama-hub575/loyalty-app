import 'package:domain/export.dart';

class LocationUseCase {
  final LocationRepo repo;
  final SharedPreferences preferences;

  LocationUseCase(this.repo, this.preferences);

  Future<Either<AppError, AppSuccess>> saveUserLocation(location) async {
    try {
      final either = await repo.saveLocation(location);
      return either.fold((error) {
        return Left(AppError());
      }, (location) async {
        await preferences.setDouble('lat', location.latitude);
        await preferences.setDouble('lng', location.longitude);
        return Right(AppSuccess());
      });
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }
}
