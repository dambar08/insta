import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/auth/LoginHelpPage.dart';
import 'package:insta/pages/auth/authentication.dart';
import 'package:insta/pages/auth/widgets/common.dart';
import 'package:insta/shared/Caption.dart';
import 'package:insta/shared/ChooseLanguage.dart';
import 'package:insta/utils/design.dart';
import 'package:insta/widgets/Button.dart';
import 'package:insta/widgets/TextLogo.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChooseLanguage(),
            Expanded(
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LogoText(text: 'Insta'),
                    Padding(
                      padding: EdgeInsets.all(kSpacingSm),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone number, email address or username',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(kSpacingSm),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(kSpacingSm),
                      child: Button(onPressed: () {}, text: 'Login'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(kSpacingSm),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Caption(text: 'Forgotten your login details?'),
                          TextButton(
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    LoginHelpPage(onTappedNext: () => {}),
                              ),
                            ),
                            child: Text('Get help with logging in.'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CommonSignUp()
          ],
        ),
      ),
    );
  }
}
