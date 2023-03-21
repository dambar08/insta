import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({Key? key, required this.text}) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(colors: [
      Color(0xffDA44bb),
      Colors.blue.shade900,
    ]);
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: new TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
      ),
    );

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
