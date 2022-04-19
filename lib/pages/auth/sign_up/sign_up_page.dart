import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/have_account_button.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';
import 'package:jam_re_store/utils/constants/assets.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
            InputName(nameController: _nameController),
            InputEmail(emailController: _emailController),
            TextEmail(),
            ContinueButton(),
            HaveAccountButton(),
            TextTermsAndConditions(),
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
        "Regístrate con email",
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
      padding: const EdgeInsets.fromLTRB(18, 0, 32, 53),
      child: Text(
        "Solo te pedimos tu nombre y correo!",
        style: TextStyleApp.bodyBase(ColorTheme.grey6),
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
    return Padding(
        padding: const EdgeInsets.fromLTRB(18, 24, 18, 0),
        child: Input(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          labelText: AppLocalizations.of(context)!.email,
        ));
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
    return Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: Input(
          controller: _nameController,
          keyboardType: TextInputType.name,
          labelText: AppLocalizations.of(context)!.nameAndLastName,
        ));
  }
}

class TextEmail extends StatelessWidget {
  const TextEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 4, 32, 0),
      child: Text(
        "Ningun usuario de Telling podrá ver tu dirección de correo electrónico.",
        style: TextStyleApp.bodyXs(ColorTheme.grey6),
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
      padding: const EdgeInsets.fromLTRB(18, 24, 18, 34),
      child: Button(
        labelText: 'Continuar',
        backgroudColor: ColorTheme.blue,
      ),
    );
  }
}

class TextTermsAndConditions extends StatelessWidget {
  const TextTermsAndConditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 34, 18, 0),
      child: Center(
        child: Text(
          "Al registrarte, aceptas los Términos de Uso, la Política de Privacidad y la Política de Cookies de Telling.",
          style: TextStyleApp.bodyXs(ColorTheme.grey7),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
