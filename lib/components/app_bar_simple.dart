import 'package:flutter/material.dart';

class AppBarSimple extends StatelessWidget implements PreferredSizeWidget {
  AppBarSimple({Key? key, required this.text})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(text),
      leading: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.chevron_left, size: 30),
      ),
    );
  }
}
