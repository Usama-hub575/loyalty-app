import 'package:domain/export.dart';

Future<void> initializeUseCasesDependencies() async {
  final RepoDependencies repoDependencies = RepoDependencies();
  await repoDependencies.init();
  await repoDependencies.initializeRepoDependencies();

  Get.lazyPut<AuthUseCase>(
    () => AuthUseCase(
      Get.find<FirebaseAuthWrapper>(),
      Get.find<AuthRepo>(),
      Get.find(tag: 'sp'),
      Get.find<RegisterUseCase>(tag: 'register'),
    ),
    fenix: true,
  );

  Get.put(
    RegisterUseCase(
      Get.find<RegisterRepo>(),
    ),
    tag: 'register',
    permanent: true,
  );

  Get.lazyPut<HomeUseCase>(
    () => HomeUseCase(
      Get.find<HomeRepo>(),
      Get.find(tag: 'sp'),
    ),
  );

  Get.lazyPut<LocationUseCase>(
    () => LocationUseCase(
      Get.find<LocationRepo>(),
      Get.find(tag: 'sp'),
    ),
    fenix: true,
  );
}
