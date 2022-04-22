import 'package:domain/export.dart';

class ReviewUseCase {
  final ReviewRepo repo;

  ReviewUseCase(this.repo);

  Future<Either<AppError, AppSuccess>> submitStoreReview(Review review) async {
    try {
      final either = await repo.submitReview(review);
      return either.fold(
        (left) => Left(AppError()),
        (right) => Right(AppSuccess()),
      );
    } catch (error) {
      return Left(AppError(title: error.toString()));
    }
  }
}
