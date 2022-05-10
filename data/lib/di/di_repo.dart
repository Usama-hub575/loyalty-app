import 'package:data/export.dart';

class RepoDependencies {
  late FirebaseAuth _firebaseAuth;
  late NetworkHelper _networkHelper;
  late EndPoints _endPoints;
  late SharedPreferences _sharedPreferences;
  late GoogleSignIn _googleSignIn;
  late FirebaseAuthWrapper _auth;
  late FacebookLogin _facebookLogin;

  Future init() async {
    _firebaseAuth = FirebaseAuth.instance;
    _auth = FirebaseAuthWrapper(_firebaseAuth);
    _endPoints = EndPoints();
    _sharedPreferences = await SharedPreferences.getInstance();
    _networkHelper = NetworkHelperImpl(_firebaseAuth, _sharedPreferences);
    _googleSignIn = GoogleSignIn();
    _facebookLogin = FacebookLogin();
  }

  initializeRepoDependencies() {
    Get.lazyPut<SharedPreferences>(
      () => _sharedPreferences,
      tag: 'sp',
      fenix: true,
    );
    Get.lazyPut<FirebaseAuthWrapper>(
      () => FirebaseAuthWrapper(_firebaseAuth),
      fenix: true,
    );

    Get.lazyPut<AuthRepo>(
      () => AuthRepoImpl(
        _googleSignIn,
        _auth,
        _facebookLogin,
        _endPoints,
        _networkHelper,
        _sharedPreferences,
      ),
      fenix: true,
    );

    Get.lazyPut<RegisterRepo>(
      () => RegisterRepoImpl(_networkHelper, _endPoints),
      fenix: true,
    );
    Get.lazyPut<HomeRepo>(
      () => HomeRepoImpl(
        _networkHelper,
        _endPoints,
        _sharedPreferences,
      ),
    );
    Get.lazyPut<LocationRepo>(
      () => LocationRepoImpl(_networkHelper, _endPoints),
      fenix: true,
    );

    Get.lazyPut<StoreDetailsRepo>(
      () => StoreDetailsRepoImpl(_networkHelper, _endPoints),
      fenix: true,
    );

    Get.lazyPut<ReviewRepo>(
      () => ReviewRepoImpl(_networkHelper, _endPoints),
      fenix: true,
    );

    Get.lazyPut<AllStoresRepo>(
      () => AllStoresRepoImpl(_networkHelper, _endPoints),
      fenix: true,
    );
  }
}
