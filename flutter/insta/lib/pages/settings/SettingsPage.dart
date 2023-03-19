import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/settings/HelpPage.dart';

enum SettingOptions {
  follow_and_invite,
  notifications,
  privacy,
  security,
  ads,
  account,
  help,
  about
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget _buildFor(SettingOptions settingOptions) {
    final page;
    final icon;
    final text;
    switch (settingOptions) {
      case SettingOptions.follow_and_invite:
        page = HelpPage();
        icon = Icon(Icons.timelapse_outlined);
        text = 'Follow and invite friends';
        break;
      case SettingOptions.notifications:
        page = HelpPage();
        icon = Icon(Icons.notifications_none_outlined);
        text = 'Notifications';
        break;
      case SettingOptions.privacy:
        page = HelpPage();
        icon = Icon(Icons.lock_outlined);
        text = 'Privacy';
        break;
      case SettingOptions.security:
        page = HelpPage();
        icon = Icon(Icons.security);
        text = 'Security';
        break;
      case SettingOptions.ads:
        page = HelpPage();
        icon = Icon(Icons.ad_units_outlined);
        text = 'Ads';
        break;
      case SettingOptions.account:
        page = HelpPage();
        icon = Icon(Icons.account_circle_outlined);
        text = 'Account';
        break;
      case SettingOptions.help:
        page = HelpPage();
        icon = Icon(Icons.help_outline_outlined);
        text = 'Help';
        break;
      case SettingOptions.about:
        page = HelpPage();
        icon = Icon(Icons.info_outline);
        text = 'About';
        break;
    }
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      ),
      child: ListTile(
        leading: icon,
        title: Text(text),
        trailing: Icon(Icons.navigate_next),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView.builder(
        itemCount: SettingOptions.values.length,
        itemBuilder: (context, index) => _buildFor(
          SettingOptions.values.elementAt(index),
        ),
      ),
    );
  }

  void _navigateTo(SettingOptions settingOptions) {
    final page;
    switch (settingOptions) {
      case SettingOptions.follow_and_invite:
        page = HelpPage();
        break;
      case SettingOptions.notifications:
        page = HelpPage();
        break;
      case SettingOptions.privacy:
        page = HelpPage();
        break;
      case SettingOptions.security:
        page = HelpPage();
        break;
      case SettingOptions.ads:
        page = HelpPage();
        break;
      case SettingOptions.account:
        page = HelpPage();
        break;
      case SettingOptions.help:
        page = HelpPage();
        break;
      case SettingOptions.about:
        page = HelpPage();
        break;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
