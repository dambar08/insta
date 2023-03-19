import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/utils/design.dart';
import 'package:insta/widgets/Button.dart';

class NewChangeUsername extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kSpacingMd),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('CHANGE USERNAME'),
                  ),
                ],
              ),
              SizedBox(
                height: kSpacingMd,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                        'Choose a username for your account. You can always change it later'),
                  ),
                ],
              ),
              SizedBox(
                height: kSpacingLg,
              ),
              Form(
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone number, email address or username',
                  ),
                ),
              ),
              Button(onPressed: () {}, text: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
