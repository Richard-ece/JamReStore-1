import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/app_bar_simple.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/chips/chip.dart';
import 'package:jam_re_store/components/telling_icon.dart';
import 'package:jam_re_store/components/texts.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class SelectTopicsPage extends HookWidget {
  const SelectTopicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(text: AppLocalizations.of(context)!.signUp),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 61),
                child: TellingIcon(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TitlePage(text: "Te damos la bienvenida a Telling!"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SubTitlePage(
                    text:
                        "Selecciona como mínimo 5 temas para mejorar tu experiencia"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: TextTopicsBase(labelText: "Arte y entretenimiento"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Arte",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Cine",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Gaming",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Musica",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Fotografia",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Tv",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Diseño Visual",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: TextTopicsBase(labelText: "Ciencia"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Ciencia",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Psicología",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Cambio climático",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: TextTopicsBase(labelText: "Cultura"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Cultura",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Comida",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Idioma",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Deportes",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Filosofía",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: ChipBase(
                        labelText: "Viajes",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        child: StartButton(),
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
    return Text(
      labelText,
      style: TextStyleApp.labelL(ColorTheme.grey11),
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
    return Button(
      labelText: 'Empezar',
      backgroudColor: ColorTheme.blue,
      onPressed: () {
        Navigator.pushNamed(context, NamesRoutes.home);
      },
    );
  }
}
