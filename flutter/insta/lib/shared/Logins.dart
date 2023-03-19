import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Logins'),
        TextButton(
          onPressed: () {},
          child: Text('Add account'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Log out profile name'),
        ),
      ],
    );
  }
}
