import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty/export.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }

  Widget _getBody() {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colors.appColor,
      body: Container(),
    );
  }
}
