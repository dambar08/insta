import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/shared/Caption.dart';

class ProfileStoryHighlight extends StatefulWidget {
  @override
  _ProfileStoryHighlightState createState() => _ProfileStoryHighlightState();
}

class _ProfileStoryHighlightState extends State<ProfileStoryHighlight> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _data[index].isExpanded = !isExpanded;
              });
            },
            children: _data.map<ExpansionPanel>((ProfileStoryItem item) {
              return ExpansionPanel(
                backgroundColor: Colors.black,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    title: Text(item.headerValue),
                    subtitle: isExpanded ? Text(item.expandedValue) : null,
                  );
                },
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueGrey, width: 1),
                                    shape: BoxShape.circle),
                                child: Icon(Icons.add),
                              ),
                              Text(
                                'New',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

final List<ProfileStoryItem> _data = generateItems(1);

List<ProfileStoryItem> generateItems(int numberOfItems) {
  return List<ProfileStoryItem>.generate(numberOfItems, (int index) {
    return ProfileStoryItem(
      headerValue: 'Story Highlight',
      expandedValue: 'Keep your favourite stories on your profile',
    );
  });
}

class ProfileStoryItem {
  ProfileStoryItem({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
