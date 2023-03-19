import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  void _onTappedReportBug(BuildContext context) {}

  void _onTappedSuggest(BuildContext context) {}

  void _onTappedClose(BuildContext context) {
    Navigator.pop(context);
  }

  void _onTapped(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('App feedback'),
          Text('Engineers use this channel to improve how the app functions'),
          InkWell(
            onTap: () => _onTappedReportBug(context),
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Report a bug'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          InkWell(
            onTap: () => _onTappedSuggest(context),
            child: ListTile(
              leading: Icon(Icons.speaker),
              title: Text('Suggest an improvement'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _onTappedClose(context),
              child: Text('Close'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.help_outline_outlined),
      onTap: () => _onTapped(context),
    );
  }
}
