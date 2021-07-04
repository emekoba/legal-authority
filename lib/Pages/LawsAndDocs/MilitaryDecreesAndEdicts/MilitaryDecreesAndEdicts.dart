import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Style/BookCover.dart';
import 'package:legal_authority/Widgets/Functional/TopTabBar.dart';

class MilitaryDecreesAndEdicts extends StatefulWidget {
  final String title;

  const MilitaryDecreesAndEdicts({this.title});

  @override
  _MilitaryDecreesAndEdictsState createState() =>
      _MilitaryDecreesAndEdictsState();
}

class _MilitaryDecreesAndEdictsState extends State<MilitaryDecreesAndEdicts> {
  PageController _pageTab;

  List<String> dates = [
    "1966",
    "1966 july - 1975 july",
    "1975 - 1976",
    "1976 - 1983",
    "1983 - 1985",
    "1985 - 1993"
  ];

  @override
  Widget build(BuildContext context) {
    List<BookCover> books = [];

    void _selectTab(String name) {
      setState(() {
        switch (name) {
          case "1966":
            _pageTab.animateToPage(0,
                duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
            break;
          case "1966 july - 1975 july":
            _pageTab.animateToPage(1,
                duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
            break;
          case "1975 - 1976":
            _pageTab.animateToPage(2,
                duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
            break;
          case "1976 - 1983":
            _pageTab.animateToPage(2,
                duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
            break;
          case "1983 - 1985":
            _pageTab.animateToPage(2,
                duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
            break;
          case "1985 - 1993":
            _pageTab.animateToPage(2,
                duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
            break;
        }
      });
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                          shape: CircleBorder(),
                          color: Theme.of(context).buttonColor,
                          onPressed: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back,
                              size: 15,
                              color: Theme.of(context).iconTheme.color)),
                      Text(widget.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(fontSize: 13)),
                      RaisedButton(
                          shape: CircleBorder(),
                          color: Theme.of(context).buttonColor,
                          onPressed: () {},
                          child: Icon(Icons.search,
                              size: 16,
                              color: Theme.of(context).iconTheme.color))
                    ])),
            TopTabBar(tabs: dates),
            Expanded(
                child: PageView(controller: _pageTab, children: [
              Center(child: Text("1966")),
              Center(child: Text("1966 july - 1975 july")),
              Center(child: Text("1975 - 1976")),
              Center(child: Text("1976 - 1983")),
              Center(child: Text("1983 - 1985")),
              Center(child: Text("1985 - 1993"))
            ]))
          ]),
        ));
  }
}
