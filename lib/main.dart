import 'package:App_Project1/src/localization/app_localization.dart';
import 'package:App_Project1/src/localization/localization_constants.dart';
import 'package:App_Project1/src/pages/wrapper/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'src/pages/1-login.dart';
import 'src/BLOC/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Provider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: _locale,
          home: Wrapper(),
          supportedLocales: [
            Locale('en', 'US'),
            Locale('ur', 'PK'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (deviceLocale, supportedLocals) {
            for (var local in supportedLocals) {
              if (local.languageCode == deviceLocale.languageCode &&
                  local.countryCode == deviceLocale.countryCode) {
                return deviceLocale;
              }
            }
            return supportedLocals.first;
          },
        ),
      );
    }
  }
}
