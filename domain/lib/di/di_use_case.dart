import 'package:data/export.dart';

import '../export.dart';

Future<void> initializeUseCasesDependencies() async {
  final RepoDependencies repoDependencies = RepoDependencies();
  await repoDependencies.init();
  repoDependencies.initializeRepoDependencies();

  Get.lazyPut<AuthUseCase>(
    () => AuthUseCase(
      Get.find<FirebaseAuthWrapper>(),
      Get.find<AuthRepo>(),
    ),
  );
}
