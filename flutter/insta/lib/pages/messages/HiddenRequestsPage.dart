import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HiddenRequestsPage extends StatefulWidget {
  @override
  _HiddenRequestsPageState createState() => _HiddenRequestsPageState();
}

class _HiddenRequestsPageState extends State<HiddenRequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hidden requests',
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: TextButton(
              onPressed: null,
              child: Text('Edit'),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        child: _EmptyMessageRequest(),
      ),
    );
  }
}

class _EmptyMessageRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2, ),
            ),
            padding: EdgeInsets.all(16),
            child: FaIcon(FontAwesomeIcons.facebookMessenger, size: 36),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              'No hidden requests',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              'Message requests that may be offensive or unwanted will appear here.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Manage hidden words preferences',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
