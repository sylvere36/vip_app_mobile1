import 'package:vip1/providers/authProvider.dart';
import 'package:vip1/startupView.dart';
import 'package:vip1/utils/UIData.dart';
import 'package:vip1/utils/route.generator.dart';
import 'package:vip1/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';

class VIPAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => LocalizationProvider(
          state: LocalizationProvider.of(context).state,
          child: MaterialApp(
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                localizationDelegate
              ],
              supportedLocales: localizationDelegate.supportedLocales,
              locale: localizationDelegate.currentLocale,
              theme: ThemeData(
                  fontFamily: 'Poppins',
                  primaryColor: ColorsData.colorsPrimary),
              title: ExtraString.appName,
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.StartUpView,
              home: StartUpView(),
              onGenerateRoute: RouteGenerator.generateRoute),
        ),
      ),
    );
  }
}
