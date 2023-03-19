import 'package:flutter/cupertino.dart';

class PostInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'leomessi',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Primer dia Feliz y agradecido por el ',
            ),
          ),
        ),
      ],
    );
  }
}
