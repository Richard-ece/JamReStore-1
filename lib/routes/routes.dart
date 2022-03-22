import 'package:flutter/material.dart';
import 'package:jam_re_store/pages/auth/sign_in/sign_in_page.dart';
import 'package:jam_re_store/pages/auth/sign_up/sign_up_page.dart';
import 'package:jam_re_store/pages/home/home.dart';
import 'package:jam_re_store/routes/names.dart';

var routes = <String, WidgetBuilder>{
  NamesRoutes.signIn: (context) => const SignInPage(),
  NamesRoutes.signUp: (context) => const SignUpPage(),
  NamesRoutes.home: (context) => const HomeView(),
};
