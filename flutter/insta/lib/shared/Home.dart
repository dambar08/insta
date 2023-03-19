import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/shared/SinglePost.dart';
import 'package:insta/shared/Stories.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insta'),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.heart),
            onPressed: () {},
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.facebookMessenger),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stories(),
            SinglePost(),
            SinglePost(),
            // ListView.builder(
            //   physics: AlwaysScrollableScrollPhysics(),
            //   scrollDirection: Axis.vertical,
            //   shrinkWrap: true,
            //   itemCount: 2,
            //   itemBuilder: (context, index) => SinglePost(),
            // )
          ],
        ),
      ),
    );
  }
}
