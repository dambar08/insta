import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/pages/settings/SettingsPage.dart';
import 'package:insta/pages/profile/ProfileEdit.dart';
import 'package:insta/pages/profile/ProfileInfo.dart';
import 'package:insta/pages/profile/ProfileName.dart';
import 'package:insta/pages/profile/ProfileSegment.dart';
import 'package:insta/pages/profile/ProfileStoryHighlight.dart';
import 'package:insta/utils/design.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void onTappedAppBarMenu() async {
    await showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                ),
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                ),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.history),
                title: Text("Archive"),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.mobileAlt),
                title: Text("Your activity"),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.qrcode),
                title: Text("QR Code"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Saved"),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.listUl),
                title: Text("Close friends"),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.heartbeat),
                title: Text("COVID-19 Information Centre"),
              )
            ],
          ),
        );
      },
    );
  }

  void _onTappedAppBarAdd() async {
    await showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          margin: EdgeInsets.only(top: kSpacingMd),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Post"),
              ),
              ListTile(
                leading: Icon(Icons.history_toggle_off),
                title: Text("Story"),
              ),
              ListTile(
                leading: Icon(Icons.highlight),
                title: Text("Story highlight"),
              ),
              ListTile(
                leading: Icon(Icons.video_label_rounded),
                title: Text("IGTV video"),
              ),
              ListTile(
                leading: Icon(Icons.live_tv),
                title: Text("Live"),
              ),
              ListTile(
                leading: Icon(Icons.map_outlined),
                title: Text("Guide"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ProfileName(),
        actions: [
          IconButton(
              icon: FaIcon(FontAwesomeIcons.plusSquare),
              onPressed: _onTappedAppBarAdd),
          IconButton(
              icon: FaIcon(FontAwesomeIcons.bars),
              onPressed: onTappedAppBarMenu),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ProfileInfo(),
            ProfileEdit(),
            IndexedStack(children: [ProfileStoryHighlight()]),
            ProfileSegment(),
          ],
        ),
      ),
    );
  }
}

// extension ProfilePageExtension on ProfilePage {
//   Future<void> onTappedMenu(context) async {
//     showBottomSheet(
//       context: context,
//       builder: (context) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Settings"),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Archive"),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Your activity"),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("QR Code"),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Saved"),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Close friends"),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("COVID-19 Information Centre"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
