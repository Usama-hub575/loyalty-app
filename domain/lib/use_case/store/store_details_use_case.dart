import 'package:domain/entities/store_details_entity.dart';
import 'package:domain/export.dart';

class StoreDetailsUseCase {
  final StoreDetailsRepo repo;

  StoreDetailsUseCase(this.repo);

  List<StoreDetailsEntity> data = [];
  List<Review> reviews = List.empty(growable: true);

  Future<Either<AppError, AppSuccess>> getStoreDetails(int storeId,
      {branchId}) async {
    try {
      data.clear();
      reviews.clear();
      final either1 = await repo.getStoreDetails(storeId);
      final either2 = await repo.getStoreReviews(storeId, branchId, size: 10);
      either1.fold((l) => null, (store) => populateStoreDetails(store));
      either2.fold((l) => null, (reviews) => populateStoreReviews(reviews));
      if (either1.isRight() || either2.isRight()) {
        return Right(AppSuccess());
      } else {
        return Left(AppError());
      }
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
        object: store.categories ?? CategoriesList([]),
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
  }

  void populateStoreReviews(ReviewList reviewList) {
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.REVIEWS,
        object: reviewList.reviewList,
      ),
    );
    data.add(
      StoreDetailsEntity(
        type: StoreDetailsDataType.SOCIAL_LINKS,
        object: Object(),
      ),
    );
    reviews.addAll(reviewList.reviewList);
  }
}
