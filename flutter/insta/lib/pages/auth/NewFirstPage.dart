import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/auth/authentication.dart';
import 'package:insta/shared/Caption.dart';
import 'package:insta/utils/design.dart';
import 'package:insta/widgets/Button.dart';

class NewFirstPage extends StatefulWidget {
  @override
  _NewFirstPageState createState() => _NewFirstPageState();
}

class _NewFirstPageState extends State<NewFirstPage> {
  Widget _buildForm() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full name',
            ),
          ),
          SizedBox(
            height: kSpacingMd,
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            value: true,
            onChanged: (bool? value) {},
            title: Caption(text: 'Remember Password'),
          ),
          Button(onPressed: () {}, text: 'Continue and Sync Contacts'),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => navigateToNewSecond(context),
                  child: Text('Continue without syncing contacts'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: kSpacingAuthTop,
            left: kSpacingLg,
            right: kSpacingLg,
            bottom: kSpacingLg,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'NAME AND PASSWORD',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: kSpacingLg),
                      child: _buildForm(),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'Your contact will be periodically synced and stored on Insta servers to help you and other find friends and to help us provide a better service. To remove contacts fo to Settings and disconnect. ',
                  style: Theme.of(context).textTheme.caption,
                  children: [
                    TextSpan(
                      text: 'Learn more.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
