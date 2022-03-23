import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/pages/welcome/welcome.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/routes/routes.dart';
import 'package:jam_re_store/utils/helpers/app_locale.dart';
import 'package:provider/provider.dart';

import 'styles/theme.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  var _authBloc = AuthBloc();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppLocale(),
      child: Consumer<AppLocale>(builder: (context, locale, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
            create: (BuildContext context) => _authBloc,
        )
          ],
          child: MaterialApp(
            title: 'JamReStore',
            theme: theme,
            routes: routes,
            locale: locale.locale,
            home: const Welcome(),
            debugShowCheckedModeBanner: false,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
          ),
        );
      }),
    );
  }
}
