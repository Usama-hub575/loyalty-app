class ReviewList {
  final List<Review> reviewList;

  ReviewList({required this.reviewList});

  factory ReviewList.fromJson(dynamic json) {
    List<Review> data = List.empty(growable: true);
    if (json['body'] != null) {
      json['body'].forEach((element) {
        data.add(Review.fromJson(element));
      });
    }
    return ReviewList(reviewList: data);
  }
}

class Review {
  final int reviewId;
  final int reviewerId;
  final String reviewerName;
  final String reviewerImageUrl;
  final int transactionId;
  final int branchId;
  final int storeId;
  final String reviewed;
  final String content;
  final int rating;

  Review({
    required this.reviewId,
    required this.reviewerId,
    required this.reviewerName,
    required this.reviewerImageUrl,
    required this.transactionId,
    required this.branchId,
    required this.storeId,
    required this.reviewed,
    required this.content,
    required this.rating,
  });

  factory Review.fromJson(dynamic json) {
    return Review(
        reviewId: json['reviewId'],
        reviewerId: json['reviewerId'],
        reviewerName: json['reviewerName'],
        reviewerImageUrl: json['reviewerImageUrl'],
        transactionId: json['transactionId'],
        branchId: json['branchId'],
        storeId: json['storeId'],
        reviewed: json['reviewed'],
        content: json['content'],
        rating: json['rating']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reviewId'] = reviewId;
    map['reviewerId'] = reviewerId;
    map['reviewerName'] = reviewerName;
    map['reviewerImageUrl'] = reviewerImageUrl;
    map['transactionId'] = transactionId;
    map['branchId'] = branchId;
    map['storeId'] = storeId;
    map['reviewed'] = reviewed;
    map['content'] = content;
    map['rating'] = rating;
    return map;
  }
}
