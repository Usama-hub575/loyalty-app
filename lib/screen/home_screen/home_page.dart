import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyality/export.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return _getBody();
  }

  Widget _getBody() {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colors.white,
      body: ListView(
        children: [
          // ScreenTypeLayout(
          //   mobile: HeaderMobile(
          //     onNavigationMenuPress: ()=>_scaffoldKey.currentState?.openDrawer(),
          //   ),
          //   tablet: HeaderTablet(),
          // ),
          verticalSpacer(110),
        ],
      ),
    );
  }
}
