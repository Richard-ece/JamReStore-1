import 'package:flutter/material.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class PostUserHeader extends StatelessWidget {
  const PostUserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserName(),
          SecundaryAction(),
        ],
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar(),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: UserNameLabel(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: PostDateLabel(),
        ),
      ],
    );
  }
}

class SecundaryAction extends StatelessWidget {
  const SecundaryAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.more_horiz),
        color: ColorTheme.grey,
        onPressed: () {},
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.blue,
        child: const Text('A'),
        radius: 16,
      ),
    );
  }
}

class UserNameLabel extends StatelessWidget {
  const UserNameLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Nombre de usuario',
        style: TextStyleApp.labelS(ColorTheme.black),
      ),
    );
  }
}

class PostDateLabel extends StatelessWidget {
  const PostDateLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Fecha Post',
        style: TextStyleApp.bodyXs(ColorTheme.grey),
      ),
    );
  }
}
