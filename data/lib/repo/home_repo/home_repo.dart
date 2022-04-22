import 'package:data/export.dart';

mixin HomeRepo {
  Future<Either<AppError, List<LocationModel>>> getUserAddress();

  Future<Either<AppError, StoresList>> getTopRatedStore();

  Future<Either<AppError, StoresList>> getNearByStore();

  Future<Either<AppError, StoreCategories>> getAllCategories();

  Future<Either<AppError, TransactionList>> getTransactions();

  Future<Either<AppError, String>> refreshToken();
}
