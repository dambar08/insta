import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Report a problem"),
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            title: Text("Help Centre"),
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            title: Text("Support requests"),
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            title: Text("Privacy and security help"),
            trailing: Icon(Icons.navigate_next),
          )
        ],
      ),
    );
  }
}
