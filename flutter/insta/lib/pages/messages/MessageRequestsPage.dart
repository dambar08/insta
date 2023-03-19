import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/pages/messages/HiddenRequestsPage.dart';

class MessageRequestsPage extends StatefulWidget {
  @override
  _MessageRequestsPageState createState() => _MessageRequestsPageState();
}

class _MessageRequestsPageState extends State<MessageRequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message requests'),
        actions: [
          TextButton(
            onPressed: null,
            child: Text('Edit'),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      "Requests aren't marked as seen until you accept them.",
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
          _buildHiddenRequestTile(),
          _EmptyMessageRequest(),
        ],
      ),
    );
  }

  Widget _buildHiddenRequestTile() {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HiddenRequestsPage(),
        ),
      ),
      child: ListTile(
        leading: FaIcon(FontAwesomeIcons.eyeSlash),
        title: Text('Hidden Requests'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '0',
              style: TextStyle(color: Colors.grey),
            ),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
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
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(16),
            child: FaIcon(FontAwesomeIcons.facebookMessenger, size: 36),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              'No message requests',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              'You don;t have any message requests.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
