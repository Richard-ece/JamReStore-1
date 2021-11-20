import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Introduction(),
    );
  }
}

class Introduction extends StatelessWidget {
  const Introduction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: AppLocalizations.of(context)!.helloWorld,
          body: 'Descripcion',
          image: Center(
            child: Image.network(
                "https://image.freepik.com/vector-gratis/personajes-diseno-plano-chateando-aplicacion-citas_23-2148271380.jpg",
                height: 175.0),
          ),
        ),
        PageViewModel(
          title: 'Titulo',
          body: 'Descripcion',
          image: Center(
            child: Image.network(
                "https://image.freepik.com/vector-gratis/personajes-diseno-plano-chateando-aplicacion-citas_23-2148271380.jpg",
                height: 175.0),
          ),
        ),
        PageViewModel(
          title: 'Titulo',
          body: 'Descripcion',
          image: Center(
            child: Image.network(
                "https://image.freepik.com/vector-gratis/personajes-diseno-plano-chateando-aplicacion-citas_23-2148271380.jpg",
                height: 175.0),
          ),
        ),
      ],
      showSkipButton: true,
      showDoneButton: false,
      skip: const Text("Skip"),
      next: const Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
      globalFooter: const Fotter(),
    );
  }
}

class Fotter extends StatelessWidget {
  const Fotter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signUp');
          },
          child: const Text('Registrarse'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tengo una cuenta'),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signIn');
              },
              child: const Text('Iniciar sesion'),
            ),
          ],
        ),
      ],
    );
  }
}
