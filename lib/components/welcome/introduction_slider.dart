import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/components/welcome/footer_auth.dart';

class IntroductionSlider extends StatelessWidget {
  const IntroductionSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: AppLocalizations.of(context)!.signUp,
          body: 'Descripcion',
          image: Center(
            child: Image.network(
                "https://image.freepik.com/vector-gratis/personajes-diseno-plano-chateando-aplicacion-citas_23-2148271380.jpg",
                height: 175.0),
          ),
        ),
        PageViewModel(
          title: 'Titulo 1',
          body: 'Descripcion 1',
          image: Center(
            child: Image.network(
                "https://image.freepik.com/vector-gratis/personajes-diseno-plano-chateando-aplicacion-citas_23-2148271380.jpg",
                height: 175.0),
          ),
        ),
        PageViewModel(
          title: 'Titulo 2',
          body: 'Descripcion 2',
          image: Center(
            child: Image.network(
                "https://image.freepik.com/vector-gratis/personajes-diseno-plano-chateando-aplicacion-citas_23-2148271380.jpg",
                height: 175.0),
          ),
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      showNextButton: false,
      globalFooter: const FooterAuth(),
    );
  }
}
