import 'package:domain/entities/store_details_entity.dart';
import 'package:domain/export.dart';

class StoreDetailsUseCase {
  final StoreDetailsRepo repo;

  StoreDetailsUseCase(this.repo);

  List<StoreDetailsEntity> data = [];

  Future<Either<AppError, AppSuccess>> getStoreDetails(int id) async {
    try {
      final either = await repo.getStoreDetails(id);
      return either.fold(
        (left) => Left(AppError()),
        (store) {
          populateStoreDetails(store);
          return Right(AppSuccess());
        },
      );
    } catch (error) {
      return Left(AppError(title: error.toString()));
    }
  }

  void populateStoreDetails(Store store) {
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.RATINGS_ERANEDPOINTS,
        object: store,
      ),
    );
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.SPACE,
        object: Object(),
      ),
    );
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.CATEGORIES,
        object: store,
      ),
    );
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.SPACE,
        object: Object(),
      ),
    );
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.ADDRESS,
        object: store,
      ),
    );
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.INVITE_CARD,
        object: store,
      ),
    );
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.SPACE,
        object: Object(),
      ),
    );
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.WRITE_REVIEW,
        object: store,
      ),
    );
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.RATINGS,
        object: store,
      ),
    );
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.REVIEWS,
        object: store,
      ),
    );
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.SOCIAL_LINKS,
        object: store,
      ),
    );
  }
}
