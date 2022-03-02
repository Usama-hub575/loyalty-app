class StoresList {
  final List<Store> list;

  StoresList(this.list);

  factory StoresList.fromJson(dynamic json) {
    List<Store> store = List<Store>.empty(growable: true);

    if (json['body'] != null) {
      json['body'].forEach((v) {
        store.add(Store.fromJson(v));
      });
    }
    return StoresList(store);
  }
}

class Store {
  final String name;
  final int redeemLimit;
  final double conversionRate;
  final String imageUrl;
  final int storeId;
  final int numberOfReviews;
  final double rating;

  Store({
    required this.name,
    required this.redeemLimit,
    required this.conversionRate,
    required this.imageUrl,
    required this.storeId,
    required this.numberOfReviews,
    required this.rating,
  });

  factory Store.fromJson(dynamic json) {
    return Store(
      name: json['name'],
      redeemLimit: json['redeemLimit'],
      conversionRate: json['conversionRate'],
      imageUrl: json['imageUrl'],
      storeId: json['storeId'],
      numberOfReviews: json['numberOfReviews'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['redeemLimit'] = redeemLimit;
    map['conversionRate'] = conversionRate;
    map['imageUrl'] = imageUrl;
    map['storeId'] = storeId;
    map['numberOfReviews'] = numberOfReviews;
    map['rating'] = rating;
    return map;
  }
}
