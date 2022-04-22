class EndPoints {
  final String _baseURL = 'https://api.dev.aactivpay.com';
  final String _isUserRegistered = '/register';
  final String _registerUser = '/register';
  final String _refreshToken = '/refresh-token';
  final String _stores = '/api/store-service/customer/stores';
  final String _categories = '/api/store-service/categories';
  final String _userLocation = '/api/location-service/locations';
  final String _customerTransaction =
      '/api/transaction-service/customer/transactions';
  final String _loginUser = '/login';
  final String _reviews = '/api/review-service/reviews';

  String isUserRegister() {
    return _baseURL + _isUserRegistered;
  }

  String registerUser() {
    return _baseURL + _registerUser;
  }

  String refreshToken() {
    return _baseURL + _refreshToken;
  }

  String getTopRatedStore({int page = 0, int size = 10}) {
    return _baseURL + _stores + '?page=$page&size=$size&nearBy=false';
  }

  String getNearByStore({int page = 0, int size = 10}) {
    return _baseURL + _stores + '?page=$page&size=$size&nearBy=true';
  }

  String getCustomerTransaction({int page = 0, int size = 3}) {
    return _baseURL + _customerTransaction + '?page=$page&size=$size';
  }

  String getAllCategories() {
    return _baseURL + _categories;
  }

  String getUserLocation() {
    return _baseURL + _userLocation;
  }

  String saveUserLocation() {
    return _baseURL + _userLocation;
  }

  String submitReview() {
    return _baseURL + _reviews;
  }

  String getStoreDetails(id) {
    return _baseURL + _stores + '/$id';
  }

  String logInUser(type, code, number) {
    return _baseURL + _loginUser + '/$type/$code/$number';
  }

  String getStoreReviews(storeId, branchId, page, size) {
    return _baseURL + _reviews + '?storeId=$storeId&page=$page&size=$size';
  }
}
