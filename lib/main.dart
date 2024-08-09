import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'services/app_language_constants.dart';
import 'services/app_router.dart';
import 'services/app_shared_preference.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {

  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AppSharedPreference.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            appSharedPreference = snapshot.data;
            return   MaterialApp.router(
              title: "MonumentalApp",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              locale: _locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              // Add this line,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router,

            );
          }
          return Container();
        });
  }
}

