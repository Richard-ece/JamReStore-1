import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/components/app_bar_simple.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/have_account_button.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/components/telling_icon.dart';
import 'package:jam_re_store/components/text_terms_conditions.dart';
import 'package:jam_re_store/components/texts.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class SignUpMailPage extends HookWidget {
  const SignUpMailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameController = useTextEditingController();
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();

    void signUp() {
      context.read<AuthBloc>().add(
            SignUpRequest(
              userSignUp: UserSignUp(
                password: _passwordController.value.text,
                email: _emailController.value.text,
                name: _nameController.value.text,
              ),
            ),
          );
      Navigator.pushNamed(context, NamesRoutes.otpNumber);
    }

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
              child: TitlePage(text: "Regístrate con email"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SubTitlePage(text: "Solo te pedimos tu nombre y correo!"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 53),
              child: InputName(nameController: _nameController),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: InputEmail(emailController: _emailController),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: TextEmail(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: ContinueButton(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 34),
              child: HaveAccountButton(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22, top: 26),
              child: TextTermsAndConditions(),
            ),
          ],
        ),
      ),
    );
  }
}

class InputEmail extends StatelessWidget {
  const InputEmail({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Input(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      labelText: AppLocalizations.of(context)!.email,
    );
  }
}

class InputName extends StatelessWidget {
  const InputName({
    Key? key,
    required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Input(
      controller: _nameController,
      keyboardType: TextInputType.name,
      labelText: AppLocalizations.of(context)!.nameAndLastName,
    );
  }
}

class TextEmail extends StatelessWidget {
  const TextEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Ningun usuario de Telling podrá ver tu dirección de correo electrónico.",
      style: TextStyleApp.bodyXs(ColorTheme.grey6),
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
      labelText: 'Continuar',
      backgroudColor: ColorTheme.blue,
      onPressed: () {
        Navigator.pushNamed(context, NamesRoutes.otp);
      },
    );
  }
}
