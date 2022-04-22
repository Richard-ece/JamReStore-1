import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/pages/home/profile/components/numbers_component.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class ProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> tabIndex = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context)!.profile)),
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Background(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              child: Avatar(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        // padding: const EdgeInsets.all(8.0),
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child:
                            Center(child: UserName(text: "Nombre de Usuario")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                            child: UserInfo(text: "Descripcion del Usuario.")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 19),
                        child: NumbersComponent(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 154),
                        child: CreateProfile(text: "Crea tu perfil"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                          child: CreateProfileDescription(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                          child: CreateProfileButton(
                            onPressed: (() {}),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
            icon: Icon(Icons.home),
            label: "asdas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "asdas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "asdas",
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: ColorTheme.black,
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorTheme.grey1,
      child: const Text(
        'PS',
      ),
      radius: 50,
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleApp.headlinesXxl(ColorTheme.grey11),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleApp.bodyL(ColorTheme.grey9),
    );
  }
}

class CreateProfile extends StatelessWidget {
  const CreateProfile({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleApp.headlinesXl(ColorTheme.textBlack),
    );
  }
}

class CreateProfileDescription extends StatelessWidget {
  const CreateProfileDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Para que tus amigos y lectores te encuentren facilmente",
        style: TextStyleApp.bodyXl(ColorTheme.grey7),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CreateProfileButton extends StatelessWidget {
  const CreateProfileButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      labelText: "Crear Perfil",
      backgroudColor: ColorTheme.blue,
      onPressed: onPressed,
    );
  }
}
