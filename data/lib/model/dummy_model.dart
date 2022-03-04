// class DummyModel {
//   DummyModel({
//       String name,
//       int redeemLimit,
//       double conversionRate,
//       String imageUrl,
//       int storeId,
//       int numberOfReviews,
//       double rating,
//       NearestBranch nearestBranch,
//   }){
//     _name = name;
//     _redeemLimit = redeemLimit;
//     _conversionRate = conversionRate;
//     _nearestBranch = nearestBranch;
//     _storeId = storeId;
//     _imageUrl = imageUrl;
//     _numberOfReviews = numberOfReviews;
//     _rating = rating;
// }
//
//   DummyModel.fromJson(dynamic json) {
//     _name = json['name'];
//     _redeemLimit = json['redeemLimit'];
//     _conversionRate = json['conversionRate'];
//     _nearestBranch = json['nearestBranch'] != null ? NearestBranch.fromJson(json['nearestBranch']) : null;
//     _storeId = json['storeId'];
//     _imageUrl = json['imageUrl'];
//     _numberOfReviews = json['numberOfReviews'];
//     _rating = json['rating'];
//   }
//   String _name;
//   int _redeemLimit;
//   double _conversionRate;
//   NearestBranch _nearestBranch;
//   int _storeId;
//   String _imageUrl;
//   int _numberOfReviews;
//   double _rating;
//
//   String get name => _name;
//   int get redeemLimit => _redeemLimit;
//   double get conversionRate => _conversionRate;
//   NearestBranch get nearestBranch => _nearestBranch;
//   int get storeId => _storeId;
//   String get imageUrl => _imageUrl;
//   int get numberOfReviews => _numberOfReviews;
//   double get rating => _rating;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['name'] = _name;
//     map['redeemLimit'] = _redeemLimit;
//     map['conversionRate'] = _conversionRate;
//     if (_nearestBranch != null) {
//       map['nearestBranch'] = _nearestBranch.toJson();
//     }
//     map['storeId'] = _storeId;
//     map['imageUrl'] = _imageUrl;
//     map['numberOfReviews'] = _numberOfReviews;
//     map['rating'] = _rating;
//     return map;
//   }
//
// }
//
// /// nearestBranchId : {"storeId":411,"appUserId":433}
// /// branchId : null
// /// lat : 78.01
// /// lng : 16.00
// /// geoDecodedAddress : "Wapda town phase 1, Lahore"
// /// nearnessCriteria : "LOCATION"
//
// class NearestBranch {
//   NearestBranch({
//       NearestBranchId nearestBranchId,
//       dynamic branchId,
//       double lat,
//       double lng,
//       String geoDecodedAddress,
//       String nearnessCriteria,}){
//     _nearestBranchId = nearestBranchId;
//     _branchId = branchId;
//     _lat = lat;
//     _lng = lng;
//     _geoDecodedAddress = geoDecodedAddress;
//     _nearnessCriteria = nearnessCriteria;
// }
//
//   NearestBranch.fromJson(dynamic json) {
//     _nearestBranchId = json['nearestBranchId'] != null ? NearestBranchId.fromJson(json['nearestBranchId']) : null;
//     _branchId = json['branchId'];
//     _lat = json['lat'];
//     _lng = json['lng'];
//     _geoDecodedAddress = json['geoDecodedAddress'];
//     _nearnessCriteria = json['nearnessCriteria'];
//   }
//   NearestBranchId _nearestBranchId;
//   dynamic _branchId;
//   double _lat;
//   double _lng;
//   String _geoDecodedAddress;
//   String _nearnessCriteria;
//
//   NearestBranchId get nearestBranchId => _nearestBranchId;
//   dynamic get branchId => _branchId;
//   double get lat => _lat;
//   double get lng => _lng;
//   String get geoDecodedAddress => _geoDecodedAddress;
//   String get nearnessCriteria => _nearnessCriteria;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_nearestBranchId != null) {
//       map['nearestBranchId'] = _nearestBranchId.toJson();
//     }
//     map['branchId'] = _branchId;
//     map['lat'] = _lat;
//     map['lng'] = _lng;
//     map['geoDecodedAddress'] = _geoDecodedAddress;
//     map['nearnessCriteria'] = _nearnessCriteria;
//     return map;
//   }
//
// }
//
// /// storeId : 411
// /// appUserId : 433
//
// class NearestBranchId {
//   NearestBranchId({
//       int storeId,
//       int appUserId,}){
//     _storeId = storeId;
//     _appUserId = appUserId;
// }
//
//   NearestBranchId.fromJson(dynamic json) {
//     _storeId = json['storeId'];
//     _appUserId = json['appUserId'];
//   }
//   int _storeId;
//   int _appUserId;
//
//   int get storeId => _storeId;
//   int get appUserId => _appUserId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['storeId'] = _storeId;
//     map['appUserId'] = _appUserId;
//     return map;
//   }
//
// }