import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/app_bar_simple.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/inputs/input_password.dart';
import 'package:jam_re_store/components/telling_icon.dart';
import 'package:jam_re_store/components/texts.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/color_theme.dart';

class CreatePasswordPage extends HookWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _passwordController = useTextEditingController();
    final _confirmedpasswordController = useTextEditingController();
    return Scaffold(
      appBar: AppBarSimple(text: AppLocalizations.of(context)!.signUp),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 61),
              child: TellingIcon(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TitlePage(
                  text: AppLocalizations.of(context)!.createPasswordTittle),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SubTitlePage(
                  text: AppLocalizations.of(context)!.createPasswordSubtittle),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 29),
              child:
                  InputCreatePassword(passwordController: _passwordController),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: InputConfirmedPassword(
                  confirmedpasswordController: _confirmedpasswordController),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ContinueButton(),
            ),
          ],
        ),
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
    return InputPassword(
      hintText: AppLocalizations.of(context)!.hintPassword,
      controller: _passwordController,
      labelText: AppLocalizations.of(context)!.password,
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
    return InputPassword(
      hintText: AppLocalizations.of(context)!.hintConfirmPassword,
      controller: _confirmedpasswordController,
      labelText: AppLocalizations.of(context)!.confirmedPassword,
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      labelText: AppLocalizations.of(context)!.continueButton,
      backgroudColor: ColorTheme.blue,
      onPressed: () {
        Navigator.pushNamed(context, NamesRoutes.selectTopics);
      },
    );
  }
}
