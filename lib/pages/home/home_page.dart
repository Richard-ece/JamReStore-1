import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/card_post.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/utils/helpers/app_locale.dart';
import 'package:provider/provider.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> tabIndex = useState(0);

    List<Widget> listScreens = [
      Container(child: CardPost()),
      Text("2"),
      Text("3"),
    ];

    void cerrarSesion() {
      Navigator.pushNamed(context, NamesRoutes.welcome);
    }

    void editarPerfil() {
      Navigator.pushNamed(context, NamesRoutes.editProfile);
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: listScreens[tabIndex.value],
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.green,
                child: DrawerHeader(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(16.0)),
              ListTile(
                title: const Text('Edit profile'),
                onTap: editarPerfil,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
              ),
              ListTile(
                title: TextButton(
                  onPressed: cerrarSesion,
                  child: Text("Sign out"),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabIndex.value,
          onTap: (int index) {
            tabIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "asdas",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "asdas",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "asdas",
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeLenguage extends StatelessWidget {
  const ChangeLenguage({Key? key}) : super(key: key);

  bool _changeLenguage(AppLocale language, bool value) {
    value == true
        ? language.changeLocale(const Locale('en'))
        : language.changeLocale(const Locale('es'));
    return value;
  }

  @override
  Widget build(BuildContext context) {
    AppLocale language = Provider.of<AppLocale>(context);
    return Column(
      children: [
        Switch(
          onChanged: (bool value) {
            _changeLenguage(language, value);
          },
          value: language.locale == const Locale('en'),
        ),
      ],
    );
  }
}
