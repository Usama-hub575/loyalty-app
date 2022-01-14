import 'package:domain/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeUseCasesDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AactivPay',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color.fromRGBO(255, 204, 51, 0.9)),
        backgroundColor: Color.fromRGBO(255, 204, 51, 0.9),
      ),
      debugShowCheckedModeBanner: false,
      unknownRoute: GetPage(
        name: '/notfound',
      ),
      initialRoute: RouteNames.splash,
      getPages: AppRoutes.getPage,
      smartManagement: SmartManagement.keepFactory,
      showPerformanceOverlay: false,
    );
  }
}
