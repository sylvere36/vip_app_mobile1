import 'package:vip1/screens/homePage.dart';
import 'package:vip1/startupView.dart';
import 'package:vip1/utils/routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.StartUpView:
        return MaterialPageRoute(builder: (_) => StartUpView());

      case Routes.Home:
        return MaterialPageRoute(builder: (_) => HomePage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Error',
          ),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}
