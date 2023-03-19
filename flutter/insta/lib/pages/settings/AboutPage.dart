import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),

      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Data Policy"),
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            title: Text("Terms of Use"),
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            title: Text("Open-source libraries"),
            trailing: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
