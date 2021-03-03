import 'package:flutter/material.dart';
import 'package:vip1/localization/keys.dart';
import 'package:flavor/flavor.dart' as fl;


class ExtraString{

  static const String appName = "IDERMATO";

  //Version
  static const String version = "Version : 1.0.0";
  static const String StorageDatakey = "APP_STORAGE_1234";

}


class ColorsData{
  //Colors
  static  Color colorsPrimary = Color(0xFF037DAE);
  static  Color colorsSecondary = Color(0xFF1DB4C5);
  static  Color colorsBlack = Color(0xFF232323);
}

class ImagesData {

  static const String imageDir = "assets/images";
  static const String iconDir = "assets/icon";
  static const String Icon = "$iconDir/icon.png";

  //static const String ImageBoltFood = "$imageDir/boltFood.jpeg";

}

class FlavorKey {
  static const String API_URL = "API_URL";
}



class API{

}



class Url {
  static String API_ULR = fl.Flavor.I.getString(FlavorKey.API_URL);
}
