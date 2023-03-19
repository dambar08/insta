import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/auth/authentication.dart';
import 'package:insta/pages/auth/widgets/common.dart';
import 'package:insta/shared/Caption.dart';
import 'package:insta/shared/ChooseLanguage.dart';
import 'package:insta/utils/design.dart';
import 'package:insta/widgets/TextLogo.dart';

enum Lang {
  eng,
  nep,
  tch,
  sch,
}

class Language {
  String name;

  Language(this.name);

  static Language fromEnum(Lang lang) {
    switch (lang) {
      case Lang.eng:
        return Language("English");
      case Lang.nep:
        return Language("Nepali");
      case Lang.tch:
        return Language("Traditional Chinese");
      case Lang.sch:
        return Language("Simplified Chinese");
    }
  }
}

class StartFormPage extends StatefulWidget {
  @override
  _StartFormPageState createState() => _StartFormPageState();
}

class _StartFormPageState extends State<StartFormPage> {
  Offset _offset = Offset(0, 0);

  Widget _buildStart() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LogoText(text: 'Insta'),
        Text('Sign up to see photos and videos from your friends'),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => navigateToSignUp(context),
              child: Text('Sign up with Email Address or Phone Number'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(0.01 * _offset.dx)
          ..rotateY(-0.01 * _offset.dy),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onHorizontalDragEnd: (details) => setState(
            () => _offset = Offset(0, 0),
          ),
          onVerticalDragEnd: (details) => setState(
            () => _offset = Offset(0, 0),
          ),
          onHorizontalDragUpdate: (details) =>
              setState(() => _offset = details.globalPosition),
          onVerticalDragUpdate: (details) =>
              setState(() => _offset = details.globalPosition),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ChooseLanguage(),
                Expanded(child: _buildStart()),
                CommonLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
