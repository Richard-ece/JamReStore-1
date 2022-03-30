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

  @override
  Widget build(BuildContext context) {
    final _numberPhone = useState("");
    final _countryCode = useState("");

    void setNumber() {
      context.read<AuthBloc>().add(
            SetNumberRequest(
              numberPhone: NumberPhone(
                number: _numberPhone.value,
                country: _countryCode.value,
              ),
            ),
          );

      Navigator.pushNamed(context, NamesRoutes.otp);
    }

    ;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signUp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
            ),
            Lottie.asset(Assets.signInAnimation, width: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: InternationalPhoneNumberInput(
                hintText: AppLocalizations.of(context)!.otpNumberPhone,
                onInputChanged: (PhoneNumber phoneNumber) {
                  _countryCode.value = phoneNumber.dialCode ?? "";
                  _numberPhone.value = phoneNumber.phoneNumber
                          ?.substring(phoneNumber.dialCode?.length ?? 1) ??
                      "";
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: PhoneNumber(
                    phoneNumber: "", dialCode: "+54", isoCode: "AR"),
                formatInput: false,
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                inputBorder: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 20,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setNumber();
                    },
                    child: Text(AppLocalizations.of(context)!.next),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
