import 'package:data/export.dart';

mixin StoreDetailsRepo {
  Future<Either<AppError, Store>> getStoreDetails(int id);

  Future<Either<AppError, ReviewList>> getStoreReviews(int storeId, int branchId,
      {int page, int size});
}
