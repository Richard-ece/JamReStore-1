import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
// import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/components/auth/otp/body.dart';
// import 'package:jam_re_store/models/auth/user.dart';
// import 'package:jam_re_store/routes/names.dart';

class OtpPage extends HookWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _codeController = useTextEditingController();

    // void otpCode() {
    //   context.read<AuthBloc>().add(
    //         ValidationCodeRequest(
    //           code: Code(
    //             code: _codeController.value.text,
    //           ),
    //         ),
    //       );

    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Codigo de Verificacion"),
      ),
      body: Body(),
    );
  }
}
