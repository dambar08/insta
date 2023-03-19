import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/auth/authentication.dart';
import 'package:insta/pages/auth/widgets/common.dart';
import 'package:insta/shared/Caption.dart';
import 'package:insta/utils/design.dart';
import 'package:insta/widgets/Button.dart';

class ConfirmationPage extends StatefulWidget {
  ConfirmationPage(
      {required this.phoneNumber,
      required this.onTappedNext,
      required this.onTappedRequestNewCode});

  final String phoneNumber;
  final Function() onTappedNext;
  final Function() onTappedRequestNewCode;

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  Future<bool> _willPopScope() async {
    return await showDialog<bool>(
            builder: (BuildContext context) {
              return AlertDialog(
                // padd
                // actionsPadding: EdgeInsets.all(0),
                // contentPadding: EdgeInsets.all(0),
                title: Text(
                  'You\'ve almost finished',
                  textAlign: TextAlign.center,
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text(
                        'Are you sure that you wan to go back?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Column(
                        children: [
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () => Navigator.of(context).pop(true),
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      'Go Back',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () => Navigator.of(context).pop(false),
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      'Cancel',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [],
              );
            },
            context: context) ??
        false;
  }

  _ConfirmationPageState();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(kSpacingLg),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("ENTER CONFIRMATION CODE"),
                      Padding(
                        padding: EdgeInsets.only(
                            top: kSpacingMd,
                            bottom: kSpacingMd,
                            left: kSpacingLg,
                            right: kSpacingLg),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      "Enter the 6-digit code we sent to \n${widget.phoneNumber} ",
                                  style: TextStyle(color: Colors.grey)),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onTappedRequestNewCode,
                                text: "Request a new one.",
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Form(
                        child: Column(
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Confirmation code',
                              ),
                            ),
                            Button(
                                text: 'Next', onPressed: widget.onTappedNext),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CommonLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
