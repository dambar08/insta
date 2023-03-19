import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/profile/ProfilePic.dart';
import 'package:insta/utils/design.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  String _formatValue(int value) {
    if (value >= 1000000) {
      return (value / 1000000).round().toString() + " M";
    }
    return value.toString();
  }

  Widget _buildFor(int value, String title) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _formatValue(value),
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kSpacingMd),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ProfilePic(),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildFor(755, 'Posts'),
                    _buildFor(249000000, 'Followers'),
                    _buildFor(271, 'Following')
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Leo Messi',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Text(
            'Bienvenidos a la cuenta oficial de Instagram de Leo Messi / Welcom to the official Leo Messi Instagram account',
          ),
        ],
      ),
    );
  }
}
