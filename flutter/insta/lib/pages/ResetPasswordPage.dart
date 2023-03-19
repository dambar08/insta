import 'package:flutter/material.dart';
import 'package:insta/widgets/Button.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              Text('Trouble Logging In?'),
              Text(
                  'Enter your email, phone, or username and we\'ll send you a link to get back into your account.'),
              TextFormField(),
              Button(
                onPressed: () {},
                text: 'Send Login Link',
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Text('OR'),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Text('Create new account'),
            ],
          ),
        ),
      ],
    );
  }
}
