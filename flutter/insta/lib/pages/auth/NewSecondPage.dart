import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/auth/authentication.dart';
import 'package:insta/utils/design.dart';
import 'package:insta/widgets/Button.dart';

class NewSecondPage extends StatefulWidget {
  @override
  _NewSecondPageState createState() => _NewSecondPageState();
}

class _NewSecondPageState extends State<NewSecondPage> {
  Widget _buildTop() {
    return Padding(
      padding: EdgeInsets.all(kSpacingLg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.cake,
            size: 55,
          ),
          SizedBox(
            height: kSpacingMd,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Add your date of birth',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            height: kSpacingMd,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'This won\'t be part of your public profile.\n Why do I need to provide my date of birth?',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: kSpacingMd,
          ),
          Form(
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone number, email address or username',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(),
        Padding(
          padding: EdgeInsets.all(kSpacingMd),
          child: Column(
            children: [
              Button(
                onPressed: () => navigateToThirdPage(context),
                text: 'Next',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            backgroundColor: Colors.white,
            mode: CupertinoDatePickerMode.date,
            minimumDate: DateTime.now().subtract(Duration(days: 365 * 80)),
            initialDateTime: DateTime.now(),
            maximumDate: DateTime.now(),
            onDateTimeChanged: (DateTime value) {},
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTop(),
            _buildBottom(),
          ],
        ),
      ),
    );
  }
}
