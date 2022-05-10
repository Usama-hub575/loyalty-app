import 'package:domain/export.dart';

class AllStoresUseCase {
  final AllStoresRepo repo;

  AllStoresUseCase(this.repo);

  List<Store> data = [];

  Future<Either<AppError, AppSuccess>> getAllStores() async {
    final either = await repo.getAllStores();
    return either.fold((error) {
      return Left(AppError());
    }, (stores) {
      populateAllStoresData(stores);
      return Right(AppSuccess());
    });
  }

  populateAllStoresData(StoresList dataList) async {
    data.clear();
    data.addAll(dataList.list);
  }
}
