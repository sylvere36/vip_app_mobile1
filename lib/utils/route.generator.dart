import 'package:vip1/screens/homePage.dart';
import 'package:vip1/screens/loginPage.dart';
import 'package:vip1/utils/routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator{

    static Route <dynamic> generateRoute(RouteSettings settings){

      switch(settings.name){

        case Routes.Home:
          return MaterialPageRoute(builder: (_)=> HomePage());

        case Routes.Login:
          return MaterialPageRoute(builder: (_)=> LoginPage());

        default:
          return _errorRoute();

      }

    }

    static Route <dynamic> _errorRoute(){

     return MaterialPageRoute(builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text('Error',),
          ),
          body: Center(
            child: Text("ERROR"),
          ),
        );
      });

    }


  }