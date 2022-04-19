import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/components/inputs/input_password.dart';
import 'package:jam_re_store/pages/welcome/welcome2_page.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TellingIcon(),
          TextPassword(),
          TextIntroduction(),
          InputCreatePassword(passwordController: _passwordController),
          InputConfirmedPassword(
              confirmedpasswordController: _confirmedpasswordController),
          Spacer(),
          ContinueButton(),
        ],
      ),
    );
  }
}

class InputCreatePassword extends StatelessWidget {
  const InputCreatePassword({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
      child: InputPassword(
        controller: _passwordController,
        labelText: 'Contraseña',
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
        obscureText: true,
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
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 4),
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
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 29),
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
        top: 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Button(
        labelText: 'Continuar',
        backgroudColor: ColorTheme.blue4,
      ),
    );
  }
}
