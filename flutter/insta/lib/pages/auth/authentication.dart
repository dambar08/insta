import 'package:flutter/material.dart';
import 'package:insta/pages/MainPage.dart';
import 'package:insta/pages/MyHomePage.dart';
import 'package:insta/pages/auth/ConfirmationPage.dart';
import 'package:insta/pages/auth/LoginPage.dart';
import 'package:insta/pages/auth/NewFirstPage.dart';
import 'package:insta/pages/auth/NewSecondPage.dart';
import 'package:insta/pages/auth/SignUpPage.dart';
import 'package:insta/pages/auth/NewThirdPage.dart';

import 'package:insta/transitions/page_transition.dart';
import 'package:insta/transitions/page_transition_enum.dart';

void navigateToLogin(BuildContext context) {
  Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: LoginPage(),
      ),
      (Route<dynamic> route) => false);
}

void show(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('This email address is on another account'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'You can log in to the account associated with that email address or you can use that email address to create a new account'),
            TextButton(
              onPressed: () {},
              child: Text('Log in to existing account'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Create New Account'),
            )
          ],
        ),
      );
    },
  );
}

void showRealDateBirthErrorDialog(BuildContext context) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter your real date of birth'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Use your own date of birth, even if this account is for a business, a pet or something elese.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            Divider(),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Ok'),
            ),
          ],
        ),
      );
    },
  );
}

void completeSignUp(BuildContext context) async {
  await Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: MainPage(),
      ),
      (Route<dynamic> route) => false);
}

void navigateToSignUp(BuildContext context) {
  Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: SignUpPage(),
      ),
      (Route<dynamic> route) => false);
}

void navigateToConfirmation(BuildContext context, String phoneNumber) async {
  await Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: ConfirmationPage(
        onTappedNext: () => navigateToNewFirst(context),
        onTappedRequestNewCode: () {},
        phoneNumber: phoneNumber,
      ),
    ),
  );
}

void navigateToNewFirst(BuildContext context) async {
  await Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: NewFirstPage(),
    ),
  );
}

void navigateToNewSecond(BuildContext context) async {
  await Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: NewSecondPage(),
    ),
  );
}

void navigateToThirdPage(BuildContext context) async {
  await Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: NewThirdPage(name: 'Dummy name'),
    ),
  );
}
