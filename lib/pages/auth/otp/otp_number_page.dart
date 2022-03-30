import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/utils/constants/assets.dart';
import 'package:lottie/lottie.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';

class OtpNumberPage extends HookWidget {
  const OtpNumberPage({Key? key}) : super(key: key);

  get number => null;

  get controller => null;

  @override
  Widget build(BuildContext context) {
    final _numberController = useTextEditingController();
    final _countryController = useTextEditingController();

    void setNumber() {
      context.read<AuthBloc>().add(SetNumberRequest(
              setNumber: Number(
            number: _numberController.value.text,
            country: _countryController.value.text,
          )));

      Navigator.pushNamed(context, NamesRoutes.otp);
    }

    ;

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.signUp),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 20,
                ),
              ),
              Lottie.asset(Assets.signInAnimation, width: 200),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  _countryController;
                  //  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  //  print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: _numberController,
                formatInput: false,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  _numberController;
                  //  print('On Saved: $number');
                },
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 20,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setNumber();
                        var formKey;
                        formKey.currentState.save();
                      },
                      child: Text('Siguiente'),
                    ),
                  ]))
            ])));
  }
}
