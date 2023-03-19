import 'package:flutter/material.dart';
import 'package:insta/pages/auth/authentication.dart';
import 'package:insta/shared/Caption.dart';

class CommonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Caption(text: 'Already have an account?'),
            TextButton(
              child: Text('Log in'),
              onPressed: () => navigateToLogin(context),
            )
          ],
        )
      ],
    );
  }
}

class CommonSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Caption(text: 'Don\'t have an account?'),
            TextButton(
              child: Text('Sign up'),
              onPressed: () => navigateToSignUp(context),
            )
          ],
        )
      ],
    );
  }
}
