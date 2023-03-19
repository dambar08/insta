import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatefulWidget {
  ProfilePic({this.innerChildPadding = 2, this.width = 100, this.height = 100});

  final double innerChildPadding;
  final double width;
  final double height;

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipOval(
            child: Image.network(
              'https://picsum.photos/${widget.width.round()}/${widget.height.round()}',
              height: widget.height,
              width: widget.width,
            ),
          ),
          Container(
            width: widget.width - widget.innerChildPadding,
            height: widget.height - widget.innerChildPadding,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.black, width: widget.innerChildPadding),
                ),
                child: ClipOval(
                  child: Container(
                    color: Colors.blue,
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
