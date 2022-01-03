import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Loyalty App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      debugShowCheckedModeBanner: false,
      // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      initialRoute: RouteNames.home,
      getPages: AppRoutes.getPage,
      smartManagement: SmartManagement.keepFactory,
      showPerformanceOverlay: false,
    );
  }
}