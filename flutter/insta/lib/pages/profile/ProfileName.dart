import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/shared/posts/VerifiedIcon.dart';

class ProfileName extends StatefulWidget {
  @override
  _ProfileNameState createState() => _ProfileNameState();
}

class _ProfileNameState extends State<ProfileName> {
  void _onTapped() async {
    await showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      context: context,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 16),
            child: Column(
              children: [
                Text('Keep up with a smaller group of friends'),
                Text(
                    'Create another account to stay in touch with a group of your friends.'),
                ElevatedButton(
                  onPressed: _onTapped,
                  child: Text('Try a New Account'),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  top: Divider.createBorderSide(context),
                  bottom: Divider.createBorderSide(context),
                ),
              ),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Log in or create new account',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapped,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.lock, size: 14),
          Title(
            color: Colors.white,
            child: Text(
              'loemessi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          VerifiedIcon(),
          RotatedBox(
            quarterTurns: 1,
            child: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
