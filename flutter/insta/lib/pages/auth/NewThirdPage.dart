import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/auth/authentication.dart';
import 'package:insta/utils/design.dart';
import 'package:insta/widgets/Button.dart';

class NewThirdPage extends StatefulWidget {
  NewThirdPage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  _NewThirdPageState createState() => _NewThirdPageState();
}

class _NewThirdPageState extends State<NewThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kSpacingMd),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign up as \n${widget.name}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: kSpacingLg,
                    ),
                    Text(
                      'Your can always change your username later.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: kSpacingLg,
                    ),
                    Button(
                        onPressed: () => completeSignUp(context), text: 'Sign Up'),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Change username',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "By tapping 'Sign Up', you agree to our ",
                  style: Theme.of(context).textTheme.caption,
                  children: [
                    TextSpan(
                      text: 'Terms Data Policy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Cookie Policy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '.'),
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
