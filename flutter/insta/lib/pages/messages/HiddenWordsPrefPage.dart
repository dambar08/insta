import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HiddenWordsPrefPage extends StatefulWidget {
  @override
  _HiddenWordsPrefPageState createState() => _HiddenWordsPrefPageState();
}

class _HiddenWordsPrefPageState extends State<HiddenWordsPrefPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hidden words'),
      ),
      body: Column(
        children: [
          Text('Hidden Offensive Content'),
        ],
      ),
    );
  }
}
