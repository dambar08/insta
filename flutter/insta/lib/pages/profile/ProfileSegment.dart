import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/pages/profile/ProfileName.dart';
import 'package:insta/utils/design.dart';

class ProfileSegment extends StatefulWidget {
  @override
  _ProfileSegmentState createState() => _ProfileSegmentState();
}

class _ProfileSegmentState extends State<ProfileSegment>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: 'LEFT',
      icon: Icon(Icons.email),
    ),
    Tab(text: 'RIGHT'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return _buildMySegment();
    // return TabBarView(
    //   controller: _tabController,
    //   children: [
    //     _buildMySegment(),
    //     _buildTagSegment()
    //   ],
    // );
    return Column(
      children: [
        DefaultTabController(

          initialIndex: 0,
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.cloud_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.beach_access_sharp),
                  ),
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightForFinite(height: 1000),
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        EmptyMySegment(),
                        CompleteProfileSection(),
                      ],
                    ),
                    Column(
                      children: [
                        EmptyTagSection(),
                        CompleteProfileSection(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EmptyMySegment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(44),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Profile',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            "When you share photos and videos, they'll appear on your profile.",
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Share your first photo or video',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyTagSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(44),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Photos and videos of you',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            "When people tag you in photos and videos, they'll appear here",
            style: TextStyle(
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CompleteProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: kSpacingMd, left: kSpacingMd, right: kSpacingMd),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Complete your profile'),
                  Text(
                    '1 of 4 complete',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.all(kSpacingMd),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        ProfileIncompleteCard(
                            type: ProfileIncompleteCardType.addProfilePhoto),
                        ProfileIncompleteCard(
                            type: ProfileIncompleteCardType.addBio),
                        ProfileIncompleteCard(
                            type: ProfileIncompleteCardType.findPeopleToFollow),
                        ProfileIncompleteCard(
                            type: ProfileIncompleteCardType.addYourName),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum ProfileIncompleteCardType {
  addProfilePhoto,
  addBio,
  findPeopleToFollow,
  addYourName,
}

class ProfileIncompleteCard extends StatefulWidget {
  final ProfileIncompleteCardType type;

  ProfileIncompleteCard({required this.type});

  @override
  _ProfileIncompleteCardState createState() => _ProfileIncompleteCardState();
}

class _ProfileIncompleteCardState extends State<ProfileIncompleteCard> {
  final double _iconSize = 32.0;
  late String titleText;
  late String secondaryText;
  late String buttonText;
  late Widget icon;

  final TextStyle titleTextStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  final TextStyle subTitleTextStyle =
      TextStyle(color: Colors.grey, fontSize: 14);

  Widget _buildAddBio() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 1.5,
        minWidth: MediaQuery.of(context).size.width / 1.5,
        maxHeight: 280,
        minHeight: 280,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: _iconSize * 2,
                height: _iconSize * 2,
                padding: EdgeInsets.all(kSpacingSm),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    100.0,
                  ),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: Align(
                  child: icon,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: kSpacingMd),
                child: Text(
                  titleText,
                  style: titleTextStyle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: kSpacingSm),
                child: Text(
                  secondaryText,
                  style: subTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: kSpacingSm),
                child: MaterialButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidget() {
    switch (widget.type) {
      case ProfileIncompleteCardType.addProfilePhoto:
        titleText = "Add Profile Photo";
        secondaryText = "Choose a profile photo to represent yourself on Insta";
        buttonText = "Add photo";
        icon = FaIcon(
          FontAwesomeIcons.idBadge,
          size: _iconSize,
        );
        break;
      case ProfileIncompleteCardType.addBio:
        titleText = "Add bio";
        secondaryText = "Tell your followers a little bit about yourself";
        buttonText = "Add bio";
        icon = FaIcon(
          FontAwesomeIcons.commentDots,
          size: _iconSize,
        );
        break;
      case ProfileIncompleteCardType.findPeopleToFollow:
        titleText = "Find people to follow";
        secondaryText = "Follow people and interests you care about";
        buttonText = "Find People";
        icon = FaIcon(
          FontAwesomeIcons.userFriends,
          size: _iconSize,
        );
        break;
      case ProfileIncompleteCardType.addYourName:
        titleText = "Add your name";
        secondaryText = "Add your full name so that your friends know it's you";
        buttonText = "Edit Name";
        icon = FaIcon(
          FontAwesomeIcons.userShield,
          size: _iconSize,
        );
        break;
    }
    return _buildAddBio();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_buildWidget()],
    );
  }
}
