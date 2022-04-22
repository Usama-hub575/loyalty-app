import 'package:data/export.dart';

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
  final NearestBranch? nearestBranch;
  final bool hasMultipleBranches;
  final int oneStar;
  final int twoStar;
  final int threeStar;
  final int fourStar;
  final int fiveStar;
  final CategoriesList? categories;

  Store({
    this.name = '',
    this.redeemLimit = 0,
    this.conversionRate = 0.0,
    this.imageUrl = '',
    this.storeId = -1,
    this.numberOfReviews = 0,
    this.rating = 0.0,
    this.nearestBranch,
    this.hasMultipleBranches = false,
    this.oneStar = 0,
    this.twoStar = 0,
    this.threeStar = 0,
    this.fourStar = 0,
    this.fiveStar = 0,
    this.categories,
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
      hasMultipleBranches: json['hasMultipleBranches'],
      oneStar: json['oneStar'],
      twoStar: json['twoStar'],
      threeStar: json['threeStar'],
      fourStar: json['fourStar'],
      fiveStar: json['fiveStar'],
      nearestBranch: json['nearestBranch'] != null
          ? NearestBranch.fromJson(json['nearestBranch'])
          : null,
      categories: json['categories'] != null
          ? CategoriesList.fromJson(json['categories'])
          : null,
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

class NearestBranch {
  final int branchId;
  final double lat;
  final double lng;
  final String geoDecodedAddress;
  final String nearnessCriteria;

  NearestBranch({
    this.branchId = -1,
    this.lat = 0.0,
    this.lng = 0.0,
    this.geoDecodedAddress = '',
    this.nearnessCriteria = '',
  });

  factory NearestBranch.fromJson(dynamic json) {
    return NearestBranch(
      branchId: json['branchId'],
      lat: json['lat'],
      lng: json['lng'],
      geoDecodedAddress: json['geoDecodedAddress'],
      nearnessCriteria: json['nearnessCriteria'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branchId'] = branchId;
    map['lat'] = lat;
    map['lng'] = lng;
    map['geoDecodedAddress'] = geoDecodedAddress;
    map['nearnessCriteria'] = nearnessCriteria;
    return map;
  }
}

class CategoriesList {
  final List<Category> categories;

  CategoriesList(this.categories);

  factory CategoriesList.fromJson(dynamic json) {
    List<Category> data = List.empty(growable: true);
    json.forEach((element) {
      data.add(Category.fromJson(element));
    });
    return CategoriesList(data);
  }
}
