import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/shared/posts/PostComment.dart';
import 'package:insta/shared/posts/PostInfo.dart';
import 'package:insta/shared/posts/PostLike.dart';
import 'package:insta/shared/posts/VerifiedIcon.dart';

class SinglePost extends StatefulWidget {
  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  void onTappedMenu() {}

  void onTappedProfileImage() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: null,
          horizontalTitleGap: 8.0,
          contentPadding: EdgeInsets.zero,
          leading: InkWell(
            onTap: onTappedProfileImage,
            child: ClipOval(
              child: Image.network('https://picsum.photos/40/40'),
            ),
          ),
          title: Row(
            children: [
              Text(
                'leomessi',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              VerifiedIcon(),
            ],
          ),
          subtitle: Text('Paid partnership'),
          trailing: GestureDetector(
            onTap: onTappedMenu,
            child: Icon(Icons.more_horiz),
          ),
        ),
        InkWell(
          onDoubleTap: () {},
          child: Stack(
            children: [
              Container(
                width: 400,
                height: 400,
                child: Image.network('https://picsum.photos/400/400'),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 1000),
                  opacity: 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Image.network('https://picsum.photos/200/200')],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(FontAwesomeIcons.heart),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(FontAwesomeIcons.comment),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.send_outlined),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.bookmark_border_outlined)),
          ],
        ),
        Container(
          child: PostLike(),
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          child: PostInfo(),
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          child: PostComment(),
        ),
      ],
    );
  }
}
