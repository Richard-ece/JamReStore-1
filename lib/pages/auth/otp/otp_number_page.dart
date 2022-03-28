import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/utils/constants/assets.dart';
import 'package:lottie/lottie.dart';

class OtpNumberPage extends HookWidget {
  const OtpNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _numberController = useTextEditingController();

    void setNumber() {
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
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Pais'),
                controller: _numberController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Numero'),
                controller: _numberController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.signUp),
                  onPressed: setNumber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
