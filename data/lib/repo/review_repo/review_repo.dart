import 'package:data/export.dart';

mixin ReviewRepo{
  Future<Either<AppError,AppSuccess>> submitReview(Review review);
}