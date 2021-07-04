// import 'package:flutter/material.dart';

// import 'package:legal_authority/Resources/Resources.dart';
// import 'package:legal_authority/Widgets/Style/BookCover.dart';
// import 'package:legal_authority/Widgets/TabButton.dart';

// class MilitaryDecreesAndEdicts extends StatefulWidget {
//   final String title;

//   const MilitaryDecreesAndEdicts({this.title});

//   @override
//   _MilitaryDecreesAndEdictsState createState() =>
//       _MilitaryDecreesAndEdictsState();
// }

// class _MilitaryDecreesAndEdictsState extends State<MilitaryDecreesAndEdicts> {
//   PageController _pageTab;

//   @override
//   void initState() {
//     super.initState();

//     _pageTab = PageController(initialPage: 0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<BookCover> books = [];

//     void _selectTab(name) {
//       setState(() {
//         switch (name) {
//           case "1966":
//             _pageTab.animateToPage(0,
//                 duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
//             break;
//           case "1966 july - 1975 july":
//             _pageTab.animateToPage(1,
//                 duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
//             break;
//           case "1975 - 1976":
//             _pageTab.animateToPage(2,
//                 duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
//             break;
//           case "1976 - 1983":
//             _pageTab.animateToPage(2,
//                 duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
//             break;
//           case "1983 - 1985":
//             _pageTab.animateToPage(2,
//                 duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
//             break;
//           case "1985 - 1993":
//             _pageTab.animateToPage(2,
//                 duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
//             break;
//         }
//       });
//     }

//     return SafeArea(
//         child: Scaffold(
//             backgroundColor: Theme.of(context).primaryColor,
//             body: Column(children: [
//               Padding(
//                   padding: EdgeInsets.only(top: 20),
//                   child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         RaisedButton(
//                             shape: CircleBorder(),
//                             onPressed: () => Navigator.pop(context),
//                             child: Icon(Icons.arrow_back, size: 15)),
//                         Text(widget.title,
//                             style: TextStyle(
//                                 // letterSpacing: 1,
//                                 fontSize: 13,
//                                 fontFamily: "Sailor",
//                                 fontWeight: FontWeight.bold)),
//                         RaisedButton(
//                             shape: CircleBorder(),
//                             onPressed: () {},
//                             child: Icon(Icons.search, size: 16))
//                       ])),
//               SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20),
//                     child: Row(children: [
//                       TabButton(
//                           name: "1966", selectTab: _selectTab, ctrl: _pageTab),
//                       TabButton(
//                           name: "1966 july - 1975 july",
//                           selectTab: _selectTab,
//                           ctrl: _pageTab),
//                       TabButton(
//                           name: "1975 - 1976",
//                           selectTab: _selectTab,
//                           ctrl: _pageTab),
//                       TabButton(
//                           name: "1976 - 1983",
//                           selectTab: _selectTab,
//                           ctrl: _pageTab),
//                       TabButton(
//                           name: "1983 - 1985",
//                           selectTab: _selectTab,
//                           ctrl: _pageTab),
//                       TabButton(
//                           name: "1985 - 1993",
//                           selectTab: _selectTab,
//                           ctrl: _pageTab),
//                     ]),
//                   )),
//               Expanded(
//                   child: PageView(controller: _pageTab, children: [
//                 Center(child: Text("1966")),
//                 Center(child: Text("1966 july - 1975 july")),
//                 Center(child: Text("1975 - 1976")),
//                 Center(child: Text("1976 - 1983")),
//                 Center(child: Text("1983 - 1985")),
//                 Center(child: Text("1985 - 1993")),
//               ]))
//             ])));
//   }
// }
