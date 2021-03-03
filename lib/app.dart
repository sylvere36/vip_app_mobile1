import 'package:vip1/locator.dart';
import 'package:vip1/providers/authProvider.dart';
import 'package:vip1/startupView.dart';
import 'package:vip1/utils/UIData.dart';
import 'package:vip1/utils/route.generator.dart';
import 'package:vip1/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:version_banner/version_banner.dart';
import 'package:flavor/flavor.dart' as fl;

class IDERMATO extends StatelessWidget {

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
            child:  VersionBanner(
              color: Colors.red,
              visible: fl.Flavor.I.isDevelopment ? true : false,
              location: BannerLocation.bottomEnd,
              text: "DEV",
              textStyle: TextStyle(),
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
                      primaryColor: ColorsData.colorsPrimary
                  ),
                  title: ExtraString.appName,
                  debugShowCheckedModeBanner: false,
                  initialRoute: Routes.StartUpView,
                  home:StartUpView(),
                  onGenerateRoute: RouteGenerator.generateRoute,
                  builder: (BuildContext context, Widget child) {
                    return Material(
                      child: GestureDetector(
                          onTap: () {
                            FocusScopeNode currentFocus =
                            FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
                          child: AbsorbPointer(
                            absorbing: auth.absorbPoint,
                            child: child,
                          )
                      )
                    );
                  },
                ),
              )
            ),
          ),
    );

  }
}


