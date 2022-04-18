import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/pages/welcome/welcome2_page.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';
import 'package:jam_re_store/utils/constants/assets.dart';

class CreatePasswordPage extends HookWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _passwordController = useTextEditingController();
    final _confirmedpasswordController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(AppLocalizations.of(context)!.signUp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TellingIcon(),
            TextPassword(),
            TextIntroduction(),
            InputPassword(passwordController: _passwordController),
            InputConfirmedPassword(
                confirmedpasswordController: _confirmedpasswordController),
            ContinueButton(),
          ],
        ),
      ),
    );
  }
}

class InputPassword extends StatelessWidget {
  const InputPassword({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 48),
      child: Input(
        controller: _passwordController,
        labelText: 'Contraseña',
        keyboardType: TextInputType.visiblePassword,
        suffixIcon: Icon(Icons.key_outlined),
      ),
    );
  }
}

class InputConfirmedPassword extends StatelessWidget {
  const InputConfirmedPassword({
    Key? key,
    required TextEditingController confirmedpasswordController,
  })  : _confirmedpasswordController = confirmedpasswordController,
        super(key: key);

  final TextEditingController _confirmedpasswordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: Input(
        controller: _confirmedpasswordController,
        labelText: 'Confirmar contraseña',
        keyboardType: TextInputType.visiblePassword,
        suffixIcon: Icon(Icons.key_outlined),
      ),
    );
  }
}

class TextPassword extends StatelessWidget {
  const TextPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 23, 18, 4),
      child: Text(
        "Elige tu contraseña",
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
      padding: const EdgeInsets.fromLTRB(18, 4, 18, 53),
      child: Text(
        "Deberá temer al menos 8 caracteres, una mayúscula y un número.",
        style: TextStyleApp.bodyBase(ColorTheme.grey6),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 200,
        left: 16,
        right: 16,
        bottom: 53,
      ),
      child: Button(
        icon: Image.asset(
          Assets.facebookIcon,
          scale: 15,
        ),
        labelText: 'Continuar',
        backgroudColor: ColorTheme.blue4,
      ),
    );
  }
}
