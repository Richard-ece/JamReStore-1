import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:jam_re_store/routes/names.dart';

class EditProfilePage extends StatefulWidget {
  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    void configuracion() {
      Navigator.pushNamed(context, NamesRoutes.settings);
    }

    void guardar() {
      Navigator.pushNamed(context, NamesRoutes.home);
    }

    void cancelar() {
      Navigator.pushNamed(context, NamesRoutes.home);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.editProfile),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                      ),
                      width: 130,
                      height: 130,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.nameAndLastName,
                    icon: Icon(Icons.person_outline),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.email,
                    icon: Icon(Icons.email_outlined),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.password,
                    icon: Icon(Icons.security_outlined),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.editProfile),
                    onPressed: configuracion,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.saveButton),
                    onPressed: guardar,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    child: Text(AppLocalizations.of(context)!.cancelButton),
                    onPressed: cancelar,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
