import 'package:domain/export.dart';

class HomeUseCase {
  final HomeRepo repo;
  final SharedPreferences preferences;

  HomeUseCase(this.repo, this.preferences);

  late List<HomeEntity> data = [];
  LocationModel userAddress = LocationModel();

  Future<Either<AppError, AppSuccess>> getHomeData() async {
    final Either<AppError, AppSuccess> either1 = await getUserAddress();
    final Either<AppError, AppSuccess> either2 = await getAllCategories();
    final Either<AppError, AppSuccess> either3 = await getTopRatedStores();
    if (userAddress.geoAddress.isNotEmpty) {
      await getNearByStore();
    } else {
      data.insert(
        0,
        HomeEntity(
          type: HomeDataType.LOCATION,
          data: Object(),
        ),
      );
    }
    final Either<AppError, AppSuccess> either4 = await getTransactionsData();
    populateInviteCode();
    if (either1.isRight() ||
        either2.isRight() ||
        either3.isRight() ||
        either4.isRight()) {
      return Right(AppSuccess());
    } else {
      return Left(AppError());
    }
  }

  Future<Either<AppError, AppSuccess>> getUserAddress() async {
    final either = await repo.getUserAddress();
    return either.fold((error) {
      return Left(AppError());
    }, (address) {
      if (address.isNotEmpty) userAddress = address[0];
      return Right(AppSuccess());
    });
  }

  Future<Either<AppError, AppSuccess>> getAllCategories() async {
    final either = await repo.getAllCategories();
    return either.fold((error) {
      return Left(AppError());
    }, (categories) {
      populateCategoriesData(categories);
      return Right(AppSuccess());
    });
  }

  Future<Either<AppError, AppSuccess>> getTopRatedStores() async {
    final either = await repo.getTopRatedStore();
    return either.fold((error) {
      return Left(AppError());
    }, (stores) {
      populateTopRattedData(stores);
      return Right(AppSuccess());
    });
  }

  Future<Either<AppError, AppSuccess>> getNearByStore() async {
    final either = await repo.getNearByStore();
    return either.fold((error) {
      return Left(AppError());
    }, (stores) {
      populateNearByData(stores);
      return Right(AppSuccess());
    });
  }

  Future<Either<AppError, AppSuccess>> getFilteredStore(
      List<int> categories) async {
    String categoriesId = '';
    categories.forEach((element) {
      categoriesId += '$element,';
    });
    final Either<AppError, AppSuccess> either1 =
        await getTopRatedFilteredStore(categoriesId);
    final Either<AppError, AppSuccess> either2 =
        await getNearByFilteredStore(categoriesId);
    if (either1.isRight() || either2.isRight()) {
      return Right(AppSuccess());
    } else {
      return Left(AppError());
    }
  }

  void populateTopRatedFilteredData(StoresList storesList) {
    if (storesList.list.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        if (data[i].type == HomeDataType.TOPRATED) {
          data.removeAt(i);
          data.insert(
            i,
            HomeEntity(
              type: HomeDataType.TOPRATED,
              data: storesList,
            ),
          );
        }
      }
    }
  }

  void populateFilteredNearByStoresData(StoresList storesList) {
    if (storesList.list.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        if (data[i].type == HomeDataType.NEARBY_DATA_CARD ||
            data[i].type == HomeDataType.NEARBY_EMPTY_CARD) {
          data.removeAt(i);
          data.insert(
            i,
            HomeEntity(
              type: HomeDataType.NEARBY_DATA_CARD,
              data: storesList,
            ),
          );
        }
      }
    } else {
      for (int i = 0; i < data.length; i++) {
        if (data[i].type == HomeDataType.NEARBY_DATA_CARD) {
          data.removeAt(i);
          data.insert(
            i,
            HomeEntity(
              type: HomeDataType.NEARBY_EMPTY_CARD,
              data: storesList,
            ),
          );
        }
      }
    }
  }

  Future<Either<AppError, AppSuccess>> getTransactionsData() async {
    final either = await repo.getTransactions();
    return either.fold((error) {
      return Left(AppError());
    }, (transactions) {
      populateTransactionData(transactions);
      return Right(AppSuccess());
    });
  }

  populateCategoriesData(StoreCategories categories) {
    final List<Category> categoryList = List.empty(growable: true);
    categoryList.add(Category(0, 'All', 0, true.obs));
    categoryList.addAll(categories.categoryList);
    StoreCategories extendedCategories = StoreCategories(categoryList);
    data.add(
      HomeEntity(
        type: HomeDataType.CATEGORIES,
        data: extendedCategories,
      ),
    );
    data.add(
      HomeEntity(
        type: HomeDataType.SPACE,
        data: Object(),
      ),
    );
  }

  populateTopRattedData(StoresList dataList) {
    if (dataList.list.isNotEmpty) {
      data.add(
        HomeEntity(
          type: HomeDataType.TOPRATED_HEADER,
          data: Object(),
        ),
      );
      data.add(
        HomeEntity(
          type: HomeDataType.TOPRATED,
          data: dataList,
        ),
      );
    }
  }

  populateNearByData(StoresList dataList) async {
    data.add(
      HomeEntity(
        type: HomeDataType.NEARBYHEADER,
        data: Object(),
      ),
    );
    if (dataList.list.isNotEmpty) {
      data.add(
        HomeEntity(
          type: HomeDataType.NEARBY_DATA_CARD,
          data: dataList,
        ),
      );
    } else {
      data.add(
        HomeEntity(
          type: HomeDataType.NEARBY_EMPTY_CARD,
          data: userAddress,
        ),
      );
    }
  }

  populateTransactionData(TransactionList transactions) {
    if (transactions.list.isNotEmpty) {
      data.add(
        HomeEntity(
          type: HomeDataType.SPACE,
          data: Object(),
        ),
      );
      data.add(
        HomeEntity(
          type: HomeDataType.TRANSACTIONS,
          data: transactions.list,
        ),
      );
      data.add(
        HomeEntity(
          type: HomeDataType.SPACE,
          data: Object(),
        ),
      );
    }
  }

  populateInviteCode() {
    data.add(
      HomeEntity(
        type: HomeDataType.INVITE,
        data: Object(),
      ),
    );
  }

  List<HomeEntity> getData() => data;

  Future<Either<AppError, AppSuccess>> getTopRatedFilteredStore(
      String categoriesId) async {
    final either = await repo.getTopRatedFilteredStore(categoriesId);
    return either.fold((error) {
      return Left(AppError());
    }, (stores) {
      populateTopRatedFilteredData(stores);
      return Right(AppSuccess());
    });
  }

  Future<Either<AppError, AppSuccess>> getNearByFilteredStore(
      String categoriesId) async {
    final either = await repo.getFilteredNearByStore(categoriesId);
    return either.fold((error) {
      return Left(AppError());
    }, (stores) {
      populateFilteredNearByStoresData(stores);
      return Right(AppSuccess());
    });
  }
}
