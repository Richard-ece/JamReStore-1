import 'package:flutter/material.dart';
import 'package:jam_re_store/pages/auth/sign_in/sign_in.dart';
import 'package:jam_re_store/pages/auth/sign_up/sign_up.dart';
import 'package:jam_re_store/pages/home/home.dart';
import 'package:jam_re_store/routes/names.dart';

var routes = <String, WidgetBuilder>{
  NamesRoutes.signIn: (context) => const SignIn(),
  NamesRoutes.signUp: (context) => const SignUp(),
  NamesRoutes.home: (context) => const HomeView(),
};
