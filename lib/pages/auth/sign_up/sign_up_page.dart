import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/routes/names.dart';

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
      Navigator.pushNamed(context, NamesRoutes.otp);
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
                onPressed: signUp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
