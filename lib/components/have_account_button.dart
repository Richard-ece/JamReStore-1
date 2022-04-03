import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/routes/names.dart';

class HaveAccountButton extends StatelessWidget {
  const HaveAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.haveAccount),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, NamesRoutes.signIn);
            },
            child: Text(AppLocalizations.of(context)!.signIn),
          ),
        ],
      ),
    );
  }
}
