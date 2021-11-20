import 'package:flutter/material.dart';
import 'pages/Home/view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JamReStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(title: 'Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}
