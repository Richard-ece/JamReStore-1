import 'package:flutter/material.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    void cerrarSesion() {
      Navigator.pushNamed(context, NamesRoutes.welcome);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Configuracion"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                Text(
                  "  Configuracion Del Perfil",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            settingsRow(context, (AppLocalizations.of(context)!.email)),
            settingsRow(
                context, (AppLocalizations.of(context)!.nameAndLastName)),
            settingsRow(
                context, (AppLocalizations.of(context)!.otpNumberPhone)),
            settingsRow(context, (AppLocalizations.of(context)!.password)),
            settingsRow(context, (AppLocalizations.of(context)!.haveAccount)),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  child: Text("Cerrar Sesión"),
                  onPressed: cerrarSesion,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector settingsRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Texto 1"),
                  Text("Texto 2"),
                  Text("Texto 3"),
                ],
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
