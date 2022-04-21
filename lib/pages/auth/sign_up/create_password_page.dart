import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/bloc/auth/auth_state.dart';
import 'package:jam_re_store/components/app_bar_simple.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/inputs/input_password.dart';
import 'package:jam_re_store/components/telling_icon.dart';
import 'package:jam_re_store/components/texts.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/models/error_input.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/utils/helpers/cool_functions.dart';

class CreatePasswordPage extends HookWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _passwordController = useTextEditingController();
    final _confirmedpasswordController = useTextEditingController();
    final _passwordListen = useValueListenable(_passwordController);
    final _confimedpasswordListen =
        useValueListenable(_confirmedpasswordController);

    var disabled = useState(true);

    useEffect(() {
      if (_passwordController.value.text.isNotEmpty &&
          _confirmedpasswordController.value.text.isNotEmpty) {
        disabled.value = false;
      } else {
        disabled.value = true;
      }
      return null;
    }, [_passwordListen, _confimedpasswordListen]);

    void createPassword() {
      context.read<AuthBloc>().add(
            CreatePasswordRequest(
              password: _passwordController.value.text,
              confirmedPassword: _confirmedpasswordController.value.text,
            ),
          );
      // Navigator.pushNamed(context, NamesRoutes.otpNumber);
    }

    return Scaffold(
      appBar: AppBarSimple(text: AppLocalizations.of(context)!.signUp),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
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
                      text: AppLocalizations.of(context)!
                          .createPasswordSubtittle),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 29),
                    child: InputCreatePassword(
                      controller: _passwordController,
                      errorInput: ErrorInput(
                        error: getErrorInput("password",
                            state.createPasswordRequestError?.errors),
                        message: getMessageErrorInput("password",
                            state.createPasswordRequestError?.errors),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: InputConfirmedPassword(
                    controller: _confirmedpasswordController,
                    errorInput: ErrorInput(
                      error: getErrorInput("confirmPassword",
                          state.createPasswordRequestError?.errors),
                      message: getMessageErrorInput("confirmPassword",
                          state.createPasswordRequestError?.errors),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ContinueButton(
                      disabled: disabled.value, onPressed: createPassword),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class InputCreatePassword extends StatelessWidget {
  const InputCreatePassword({
    Key? key,
    required this.controller,
    required this.errorInput,
  }) : super(key: key);

  final TextEditingController controller;
  final ErrorInput errorInput;

  @override
  Widget build(BuildContext context) {
    return InputPassword(
      hintText: AppLocalizations.of(context)!.hintPassword,
      controller: controller,
      labelText: AppLocalizations.of(context)!.password,
    );
  }
}

class InputConfirmedPassword extends StatelessWidget {
  InputConfirmedPassword({
    Key? key,
    required this.controller,
    required this.errorInput,
  }) : super(key: key);

  final TextEditingController controller;
  final ErrorInput errorInput;

  @override
  Widget build(BuildContext context) {
    return InputPassword(
      hintText: AppLocalizations.of(context)!.hintConfirmPassword,
      controller: controller,
      labelText: AppLocalizations.of(context)!.confirmedPassword,
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    required this.onPressed,
    required this.disabled,
  }) : super(key: key);

  final void Function() onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Button(
      labelText: AppLocalizations.of(context)!.continueButton,
      backgroudColor: ColorTheme.blue,
      onPressed: onPressed,
      disabled: disabled,
    );
  }
}
