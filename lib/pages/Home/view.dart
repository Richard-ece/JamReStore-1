import 'package:flutter/material.dart';
import 'package:jam_re_store/utils/helpers/app_locale.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _changeLenguage(AppLocale language, bool value) {
    value == true
        ? language.changeLocale(const Locale('en'))
        : language.changeLocale(const Locale('es'));
    return value;
  }

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<AppLocale>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Text(AppLocalizations.of(context)!.helloWorld),
          Switch(
            onChanged: (bool value) {
              _changeLenguage(language, value);
            },
            value: language.locale == const Locale('en'),
          ),
        ],
      ),
    );
  }
}
