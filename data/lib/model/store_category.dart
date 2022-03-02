import 'package:data/export.dart';

class StoreCategories {
  final List<Category> categoryList;

  StoreCategories(this.categoryList);

  factory StoreCategories.fromJson(dynamic json) {
    final List<Category> categories = List<Category>.empty(growable: true);
    if (json['body'] != null) {
      json['body'].forEach((v) {
        categories.add(Category.fromJson(v));
      });
    }
    return StoreCategories(categories);
  }
}

class Category {
  final int categoryId;
  final String name;
  Rx<bool> isActive;

  Category(this.categoryId, this.name, this.isActive);

  factory Category.fromJson(dynamic json) {
    return Category(
      json["categoryId"],
      json["name"],
      false.obs,
    );
  }
}
