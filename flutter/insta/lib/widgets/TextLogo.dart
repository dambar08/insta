import 'package:flutter/cupertino.dart';

class LogoText extends StatelessWidget {
  const LogoText({Key? key, required this.text}) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 50.0, 70.0));
    return Text(
      text,
      style: new TextStyle(
          fontSize: 60.0,
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader = linearGradient),
    );
  }
}
