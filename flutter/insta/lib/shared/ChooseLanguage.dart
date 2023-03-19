import 'package:flutter/material.dart';
import 'package:insta/utils/design.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  Future<void> _onClickLanguage() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Title(
              color: Colors.blue,
              child: Text("Language"),
            ),
            ListTile(
              title: Text('English'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onClickLanguage,
      child: Padding(
        padding: EdgeInsets.all(kSpacingMd),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Text('English'), Icon(Icons.keyboard_arrow_down)],
        ),
      ),
    );
  }
}
