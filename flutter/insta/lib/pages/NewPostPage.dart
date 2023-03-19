import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
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
