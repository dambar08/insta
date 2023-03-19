import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Caption extends StatelessWidget {
  const Caption({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.caption);
  }
}
