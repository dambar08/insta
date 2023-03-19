import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowRequestPage extends StatefulWidget {
  @override
  _FollowRequestPageState createState() => _FollowRequestPageState();
}

class _FollowRequestPageState extends State<FollowRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Follow Requests'),
      ),
      body: Text('s'),
    );
  }
}

class FollowListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.network('https://picsum.photos/50/50'),
      ),
      title: Column(
        children: [
          Text('Name'),
          Text('Sub name'),
          Text('Follow settings'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Confirm'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('Delete'),
          )
        ],
      ),
    );
  }
}

class SuggestFollowListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.network('https://picsum.photos/50/50'),
      ),
      title: Column(
        children: [
          Text('Name'),
          Text('Sub name'),
          Text('Follow settings'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Confirm'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('Delete'),
          )
        ],
      ),
    );
  }
}
