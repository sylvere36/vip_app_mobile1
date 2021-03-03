import 'package:flavor/flavor.dart';
import 'package:vip1/app.dart';
import 'package:vip1/locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:vip1/utils/UIData.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/services.dart' as srv;
import 'package:flutter_translate/flutter_translate.dart';

void main() async {
  setupLocator();
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'fr', supportedLocales: ['en', 'fr']);

  Flavor.create(
    Environment.dev,
    color: Colors.green,
    name: 'VIP 1 DEV',
    properties: {FlavorKey.API_URL: 'https://vipapp.kisayo-finance.com/api/'},
  );

  WidgetsFlutterBinding.ensureInitialized();
  srv.SystemChrome.setPreferredOrientations([
    srv.DeviceOrientation.portraitUp,
    srv.DeviceOrientation.portraitDown
  ]).then(
    (_) {
      timeago.setLocaleMessages('fr', timeago.FrMessages());
      runApp(DevicePreview(
          enabled: false,
          builder: (context) => LocalizedApp(delegate, VIPAPP())));
    },
  );
}
