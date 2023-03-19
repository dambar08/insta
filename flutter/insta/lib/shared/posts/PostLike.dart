import 'package:flutter/material.dart';

class PostLike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 30),
              child: _SinglePostLikeImage(),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: _SinglePostLikeImage(),
            ),
            _SinglePostLikeImage(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 4),
          child: RichText(
            text: TextSpan(
              text: 'Liked by ',
              children: [
                TextSpan(
                  text: 'Kitty',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: ' and ',
                ),
                TextSpan(
                  text: '400,000,000 others',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SinglePostLikeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: ClipOval(
        child: Image.network('https://picsum.photos/20/20'),
      ),
    );
  }
}
