import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/utils/design.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kSpacingSm),
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Edit Profile'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: kSpacingSm),
            child: OutlinedButton(
              onPressed: () {},
              child: Icon(Icons.arrow_downward_rounded),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryHighlight() {
    return Row(
      children: [
        ClipOval(
          child: Container(
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
