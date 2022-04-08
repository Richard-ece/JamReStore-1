import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class PostHomeView extends StatelessWidget {
  const PostHomeView({
    Key? key,
  }) : super(key: key);
  final Avatar =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
  final Image =
      'https://images.indianexpress.com/2022/02/recycle_200_gettu.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: postsListView(context),
    );
  }

  Widget postRow(BuildContext context) {
    const double avatarDiameter = 44;
    return GestureDetector(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: avatarDiameter,
              height: avatarDiameter,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarDiameter / 2),
                child: CachedNetworkImage(
                  imageUrl: Avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          TextButton(
            child: Text("Username"),
            onPressed: () {},
          ),
          Text(
            "Post date",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 11.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: Text('Welcome to the post!'),
    );
  }

  Widget postImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: Image,
      ),
    );
  }

  Widget postView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        postRow(context),
        postImage(),
        postCaption(),
        postLike(context),
        postComment(context),
      ],
    );
  }

  Widget postLike(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: LikeButton(
          circleColor: CircleColor(
              start: Color.fromARGB(255, 0, 255, 21),
              end: Color.fromARGB(255, 48, 204, 0)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color.fromARGB(255, 107, 229, 51),
            dotSecondaryColor: Color.fromARGB(255, 14, 121, 0),
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.favorite_outlined,
              color: isLiked ? Color.fromARGB(255, 37, 172, 3) : Colors.grey,
            );
          },
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //likeCount: 7,
        ),
      ),
    );
  }

  Widget postComment(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: LikeButton(
          circleColor: CircleColor(
              start: Color.fromARGB(255, 0, 255, 21),
              end: Color.fromARGB(255, 48, 204, 0)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color.fromARGB(255, 107, 229, 51),
            dotSecondaryColor: Color.fromARGB(255, 14, 121, 0),
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.comment,
              color: Colors.grey,
            );
          },
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }

  Widget postsListView(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return postView(context);
        });
  }
}
