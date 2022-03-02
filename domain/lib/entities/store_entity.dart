import 'package:domain/export.dart';

class StoreEntity {
  final String name;
  final String image;
  final String address;
  final double lat;
  final double lng;
  final int earnedPoint;
  final double rating;
  final double numOfReviews;
  final List<ReviewsEntity> reviews;
  final List<String> category;
  final List<TransactionEntity> transactions;
  final List<String> socialLinks;

  StoreEntity({
    this.name = '',
    this.image = '',
    this.address = '',
    this.lat = 0.0,
    this.lng = 0.0,
    this.earnedPoint = 0,
    this.rating = 0.0,
    this.numOfReviews = 0,
    this.reviews = const [],
    this.category = const [],
    this.transactions = const [],
    this.socialLinks = const [],
  });

  factory StoreEntity.fromModel(Store data) {
    return StoreEntity();
  }
}
