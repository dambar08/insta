import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/HelpPage.dart';
import 'package:insta/utils/design.dart';
import 'package:insta/widgets/Button.dart';

class LoginHelpPage extends StatelessWidget {
  LoginHelpPage({required this.onTappedNext});

  final Function() onTappedNext;

  Widget _buildForm() {
    return Form(
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone number, email address or username',
            ),
          ),
          Button(
            text: 'Next',
            onPressed: onTappedNext,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login help', ),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 42, left: kSpacingLg, right: kSpacingLg),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Find your account',
                      style: TextStyle(fontSize: 22),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: Text(
                          'Enter your username or the email address or phone number linked to your account'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: _buildForm(),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpPage(),
                      ),
                    ),
                    child: Text("Need more help?"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
