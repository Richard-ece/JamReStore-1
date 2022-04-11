import 'package:flutter/material.dart';
import 'package:jam_re_store/models/post/post.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class PostUserHeader extends StatelessWidget {
  const PostUserHeader({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserName(
            post: post,
          ),
          SecundaryAction(),
        ],
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar(
          pathAvatar: post.avatarUser,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: UserNameLabel(userName: post.nameUser),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: PostDateLabel(postDate: post.datePost),
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
  const Avatar({Key? key, required this.pathAvatar}) : super(key: key);
  final String? pathAvatar;

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
  const UserNameLabel({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        userName,
        style: TextStyleApp.labelS(ColorTheme.black),
      ),
    );
  }
}

class PostDateLabel extends StatelessWidget {
  const PostDateLabel({Key? key, required this.postDate}) : super(key: key);
  final String postDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        postDate,
        style: TextStyleApp.bodyXs(ColorTheme.grey),
      ),
    );
  }
}
