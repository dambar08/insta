import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/profile/ProfilePic.dart';
import 'package:insta/shared/SingleStory.dart';

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: stories,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // stories.insert(
    //   1,
    //   ProfilePic(
    //     width: 80,
    //     height: 80,
    //     innerChildPadding: 3,
    //   ),
    // );
  }
}

class StoryHero extends StatefulWidget {
  @override
  State<StoryHero> createState() => _StoryHeroState();
}

class _StoryHeroState extends State<StoryHero> {
  @override
  Widget build(BuildContext context) {
    return SingleStory(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              // The blue background emphasizes that it's a new route.
              color: Colors.lightBlueAccent,
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.topLeft,
              child: SingleStory(
                photo: 'https://picsum.photos/200/200',
                width: double.infinity,
                height: double.infinity,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        }));
      },
      width: 70,
      photo: 'https://picsum.photos/70/70',
      height: 70,
    );
  }
}

List<Widget> stories = List.generate(
  10,
  (index) => SizedBox(
    width: 80,
    height: 100,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: index == 0
          ? ProfilePic(
              width: 70,
              height: 70,
              innerChildPadding: 3,
            )
          : StoryHero(),
    ),
  ),
);
