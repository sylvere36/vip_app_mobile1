import 'package:flutter/material.dart';

class NavigateHelper {

  static navigate(BuildContext context, String routename,
      {withpop: false, logout: false, args, bool passFunc, Function func}) {
    if (logout) {
      if(args != null){
        Navigator.of(context)
            .pushNamedAndRemoveUntil(routename, (Route<dynamic> route) => false, arguments: args);
      }else{
        Navigator.of(context)
            .pushNamedAndRemoveUntil(routename, (Route<dynamic> route) => false);
      }

    } else {
      if (withpop) {
        if (args!=null) {
          Navigator.of(context).pushNamed(routename,arguments: args);
        }else{
          Navigator.of(context).pushNamed(routename);
        }
      } else {
        if (args!=null) {
          Navigator.of(context).pushReplacementNamed(routename,arguments: args);
        }else{
          Navigator.of(context).pushReplacementNamed(routename);
        }
      }
    }
  }
}
