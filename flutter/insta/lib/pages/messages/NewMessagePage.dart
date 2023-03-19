import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Message'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Chat'),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
