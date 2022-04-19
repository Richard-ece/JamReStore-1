import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/chips/chip.dart';
import 'package:jam_re_store/pages/home/home_page.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';
import 'package:jam_re_store/utils/constants/assets.dart';

class SelectTopicsPage extends HookWidget {
  const SelectTopicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signUp),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TellingIcon(),
            TextWelcome(),
            TextIntroduction(),
            TextTopicsBase(labelText: "Arte y entretenimiento"),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChipBase(
                    labelText: "Arte",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChipBase(
                    labelText: "Cine",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChipBase(
                    labelText: "Gaming",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChipBase(
                    labelText: "Musica",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChipBase(
                    labelText: "Fotografia",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChipBase(
                    labelText: "Tv",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChipBase(
                    labelText: "Diseño Visual",
                  ),
                ),
                TextTopicsBase(labelText: "Ciencia"),
                StartButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TellingIcon extends StatelessWidget {
  const TellingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 61, 18, 16),
      child: Image.asset(
        Assets.tellinBlack,
        width: 36,
      ),
    );
  }
}

class TextWelcome extends StatelessWidget {
  const TextWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 4),
      child: Text(
        "Te damos la bienvenida a Telling!",
        style: TextStyleApp.labelXl(ColorTheme.grey11),
      ),
    );
  }
}

class TextIntroduction extends StatelessWidget {
  const TextIntroduction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 32, 0),
      child: Text(
        "Selecciona como mínimo 5 temas para mejorar tu experiencia",
        style: TextStyleApp.bodyBase(ColorTheme.grey6),
      ),
    );
  }
}

class TextTopicsBase extends StatelessWidget {
  const TextTopicsBase({
    Key? key,
    required this.labelText,
  }) : super(key: key);
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 53, 18, 33),
      child: Text(
        labelText,
        style: TextStyleApp.labelL(ColorTheme.grey11),
      ),
    );
  }
}

class ChipBase extends HookWidget {
  const ChipBase({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  final String labelText;
  @override
  Widget build(BuildContext context) {
    var isSelected = useState(true);

    return TagChip(
      labelText,
      backgroudColor: ColorTheme.grey1,
      labelText: labelText,
      selected: isSelected.value,
      onTap: () {
        isSelected.value = !isSelected.value;
      },
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 24, 18, 34),
      child: Button(
        labelText: 'Empezar',
        backgroudColor: ColorTheme.blue,
      ),
    );
  }
}
