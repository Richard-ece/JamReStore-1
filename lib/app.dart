import 'package:flutter/material.dart';
import 'package:jam_re_store/pages/Home/view.dart';
// import 'pages/Welcome/view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/utils/helpers/app_locale.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppLocale(),
      child: Consumer<AppLocale>(builder: (context, locale, child) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale.locale,
          title: 'JamReStore',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeView(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
