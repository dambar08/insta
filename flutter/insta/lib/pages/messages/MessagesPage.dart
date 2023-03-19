import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/messages/MessageRequestsPage.dart';
import 'package:insta/pages/profile/ProfileName.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBar(
          title: ProfileName(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.video_call_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.pending_actions),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Messages",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MessageRequestsPage(),
                    ),
                  ),
                  child: Text("0 requests"),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(44),
            child: EmptyMessage(
              titleText: 'Message your friends',
              subTitleText:
                  "Message, video chat or share your favourite posts directly wuth people you care about.\n\nPeople who use Instagram or Facebook can chat across apps. Use the message controls in Settings to decide who you want to hear from.",
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyMessage extends StatelessWidget {
  const EmptyMessage(
      {required this.titleText, required this.subTitleText, this.child});

  final String titleText;
  final String subTitleText;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titleText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          child: Text(
            subTitleText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          'Lean more about your privacy',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.orange),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            'Send Message',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue),
          ),
        ),
        child != null ? child! : SizedBox.shrink(),
      ],
    );
  }
}
