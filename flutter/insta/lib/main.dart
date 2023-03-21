import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/pages/MainPage.dart';
import 'package:insta/pages/MyHomePage.dart';
import 'package:insta/pages/SplashPage.dart';
import 'package:insta/pages/auth/LoginPage.dart';
import 'package:insta/pages/auth/SignUpPage.dart';
import 'package:insta/pages/auth/StartFormPage.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/widgets/Loading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(InstaApplication());
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return SplashPage();
          }
          return Loading();
        },
      ),
    );
  }
}

final kApplicationKey = GlobalKey();

class InstaApplication extends StatefulWidget {
  @override
  _InstaApplicationState createState() => _InstaApplicationState();
}

class _InstaApplicationState extends State<InstaApplication> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
      ),
      home: MaterialApp(
        key: kApplicationKey,
        title: 'Insta',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: AppColors.white,
          bottomAppBarColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
          ),
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
          appBarTheme: AppBarTheme(
            centerTitle: false,
            backgroundColor: Colors.black,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => StartFormPage(),
          '/login': (context) => LoginPage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/signup': (context) => SignUpPage(),
        },
        // home: MainPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
