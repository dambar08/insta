import 'package:flutter/material.dart';
import 'package:insta/pages/NewPostPage.dart';
import 'package:insta/pages/profile/ProfilePage.dart';
import 'package:insta/pages/SearchPage.dart';
import 'package:insta/pages/ShopPage.dart';
import 'package:insta/shared/Home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const pages = [
    HomePage(),
    SearchPage(),
    NewPostPage(),
    ShopPage(),
    ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
  }

  var _selectedIndex = 0;

  void onTappedBottomNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onTappedBottomNav,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            label: 'New post',
            icon: Icon(Icons.plus_one_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Shop',
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.account_circle_outlined),
          )
        ],
      ),
    );
  }
}
