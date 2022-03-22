import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignUp extends HookWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameController = useTextEditingController();
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();

    void register() {
      print(_nameController.value.text);
      print(_emailController.value.text);
      print(_passwordController.value.text);

      // Llamar al blocs
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signUp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre'),
              controller: _nameController,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              controller: _emailController,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              controller: _passwordController,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context)!.signUp),
                onPressed: register,
              ),
            )
          ],
        ),
      ),
    );
  }
}
