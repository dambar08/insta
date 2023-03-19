import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insta"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Our"),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ],
      ),
    );
  }
}
