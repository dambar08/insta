import 'package:flutter/material.dart';

class SingleStory extends StatelessWidget {
  SingleStory(
      {Key? key, required this.photo, required this.onTap, required this.width, required this.height})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: onTap,
                child: Container(
                  width: width,
                  height: height,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.greenAccent, width: 2.5),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      photo,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  'cristiano ronaldo',
                  style: TextStyle(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
