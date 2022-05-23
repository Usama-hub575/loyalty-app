import 'package:data/export.dart';


mixin AllStoresRepo {
  Future<Either<AppError, StoresList>> getAllStores();

}