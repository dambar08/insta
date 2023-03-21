import 'package:flutter/material.dart';
import 'package:insta/pages/auth/authentication.dart';
import 'package:insta/pages/auth/widgets/common.dart';
import 'package:insta/shared/Caption.dart';
import 'package:insta/utils/design.dart';
import 'package:insta/widgets/Button.dart';

enum SignUpType { phoneNumber, email }

class SignUpPage extends StatefulWidget {
  SignUpPage({this.type = SignUpType.phoneNumber});

  final SignUpType type;

  @override
  _SignUpPageState createState() => _SignUpPageState(type);
}

class _SignUpPageState extends State<SignUpPage> {
  _SignUpPageState(this.type);

  SignUpType type;

  void _onTappedPhoneNumber() {
    setState(() => type = SignUpType.phoneNumber);
  }

  void _onTappedEmail() {
    setState(() => type = SignUpType.email);
  }

  Widget _buildUnderlinedText(String text, bool selected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [],
    );
  }

  Widget _buildForm() {
    return type == SignUpType.phoneNumber
        ? _buildPhoneNumberForm()
        : _buildEmailAddressForm();
  }

  Widget _buildPhoneNumberForm() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone number',
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: kSpacingMd),
            child: Caption(
              text:
                  "You may receive SMS updates from Insta and can opt out at any time",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailAddressForm() {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(kSpacingSm),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
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
              top: kSpacingLg, left: kSpacingLg, right: kSpacingLg),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.account_circle_outlined,
                          size: 100,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: _onTappedPhoneNumber,
                            child: Text(
                              'PHONE NUMBER',
                              style: TextStyle(
                                  fontWeight: type == SignUpType.phoneNumber
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: _onTappedEmail,
                            child: Text(
                              'EMAIL',
                              style: TextStyle(
                                  fontWeight: type == SignUpType.email
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                    _buildForm(),
                    Button(
                        onPressed: () =>
                            navigateToConfirmation(context, '+00 00000000'),
                        text: 'Next')
                  ],
                ),
              ),
              CommonLogin()
            ],
          ),
        ),
      ),
    );
  }
}
