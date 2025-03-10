import 'package:domain/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeUseCasesDependencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AactivPay',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color.fromRGBO(60, 53, 255, 1)),
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      ),
      debugShowCheckedModeBanner: false,
      unknownRoute: GetPage(
        name: '/notfound',
      ),
      initialRoute: RouteNames.splashScreen,
      getPages: AppRoutes.getPage,
      smartManagement: SmartManagement.keepFactory,
      showPerformanceOverlay: false,
    );
  }
}
