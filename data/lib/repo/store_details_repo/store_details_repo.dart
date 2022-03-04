import 'package:data/export.dart';

mixin StoreDetailsRepo {
  Future<Either<AppError, Store>> getStoreDetails(int id);
}