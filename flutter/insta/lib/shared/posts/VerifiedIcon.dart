import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VerifiedIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4),
      child: Stack(
        alignment: Alignment.center,
        children: [
          FaIcon(FontAwesomeIcons.certificate, size: 12.0, color: Colors.blue),
          FaIcon(FontAwesomeIcons.check, size: 6.0),
        ],
      ),
    );
  }
}
