import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/MyHomePage.dart';
import 'package:insta/pages/NewPostPage.dart';
import 'package:insta/pages/PostsPage.dart';
import 'package:insta/pages/profile/ProfilePage.dart';
import 'package:insta/pages/SearchPage.dart';
import 'package:insta/pages/ShopPage.dart';
import 'package:insta/pages/SplashPage.dart';
import 'package:insta/shared/CameraPage.dart';
import 'package:insta/shared/Home.dart';
import 'package:insta/pages/messages/MessagesPage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Camera',
      icon: Icon(Icons.email),
    ),
    Tab(
      text: 'Home',
      icon: Icon(Icons.home),
    ),
    Tab(
      text: 'Message',
      icon: Icon(Icons.message),
    ),
  ];

  late TabController _tabController;
  late CameraDescription _firstCamera;

  @override
  void initState() {
    // initAsync();
    super.initState();

    _tabController =
        TabController(vsync: this, length: myTabs.length, initialIndex: 1);
  }

  void initAsync() async {
    final cameras = await availableCameras();
    _firstCamera = cameras.first;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: [
              FutureBuilder<List<CameraDescription>>(
                future: availableCameras(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CameraPage(
                      camera: snapshot.data!.first,
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error');
                  } else {
                    return SplashPage();
                  }
                },
              ),
              MyHomePage(),
              MessagesPage(),
            ],
          ),
        ),
      ),
    );
  }
}
