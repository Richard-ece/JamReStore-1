import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/card_post/card_post.dart';
import 'package:jam_re_store/components/card_post/card_post_small.dart';
import 'package:jam_re_store/models/post/post.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/utils/helpers/app_locale.dart';
import 'package:provider/provider.dart';

class HomePage extends HookWidget {
  HomePage({Key? key}) : super(key: key);
  final post = Post(
    nameUser: 'User',
    avatarUser: null,
    imagePost: null,
    titlePost: 'Titulo mediano que ocupa 2 lineas verticales',
    subTitlePost:
        'Es una medida tomada por el ministerio de seguridad y eventos naturales, para evitar cualquier accidente que damnifique a los tripulantes y a la carga, que proviene...',
    datePost: '20/04/2022',
    idPost: '1',
  );

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> tabIndex = useState(0);
    final ScrollController _firstController = useScrollController();

    List<Widget> listScreens = [
      ListView.builder(
          controller: _firstController,
          itemCount: 100,
          itemBuilder: (context, int index) {
            return CardPostSmall(
              post: post,
            );
          }),
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
          centerTitle: true,
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
