import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Choices {
  shop,
  editorPicks,
  collections,
  guides,
  videos,
}

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void onTappedWishlist() {}

  void onTappedMenu() {}

  void onTappedChoice(int index) {}

  Widget _buildChoices() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: Choices.values.length,
      itemBuilder: (context, index) {
        return Container(
          child: Text("something"),
        );
        // return OutlinedButton(
        //   style: OutlinedButton.styleFrom(
        //     padding: EdgeInsets.symmetric(horizontal: 12),
        //   ),
        //   onPressed: () {},
        //   child: Text(
        //     Choices.values.elementAt(index).toString(),
        //   ),
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        actions: [
          IconButton(
            onPressed: onTappedWishlist,
            icon: Icon(Icons.list_alt_outlined, size: 24),
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.bars, size: 22),
            onPressed: onTappedMenu,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildChoices(),
          ],
        ),
      ),
    );
  }
}
