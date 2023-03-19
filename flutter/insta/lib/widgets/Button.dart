import 'package:flutter/material.dart';

enum Type {
  primary,
  secondary,
}

class Button extends StatelessWidget {
  Button({required this.onPressed, required this.text, this.disabled = false});

  final Function() onPressed;
  final String text;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: MaterialButton(
            disabledColor: Theme.of(context).colorScheme.primaryVariant,
            color: Theme.of(context).colorScheme.primary,
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
