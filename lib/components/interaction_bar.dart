import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jam_re_store/styles/color_theme.dart';

class InteractionBar extends StatelessWidget {
  const InteractionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        children: [
          LikeButton(),
          FavBookMarkButton(),
          ShareButton(),
          CommetButton(),
        ],
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(CupertinoIcons.heart),
        color: ColorTheme.grey,
        onPressed: () {},
      ),
    );
  }
}

class FavBookMarkButton extends StatelessWidget {
  const FavBookMarkButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.bookmark_outline),
        color: ColorTheme.grey,
        onPressed: () {},
      ),
    );
  }
}

class CommetButton extends StatelessWidget {
  const CommetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.comment_outlined),
        color: ColorTheme.grey,
        onPressed: () {},
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(CupertinoIcons.share),
        color: ColorTheme.grey,
        onPressed: () {},
      ),
    );
  }
}
