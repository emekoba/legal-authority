// "Company": <String, dynamic>{
//       "icon": Icons.business,
//       "books": {
//         "Acts Authentication Act": {
//           "cover": AssetImage(
//               'lib/Resources/Media/Photos/Background/background2.jpg'),
//           "date-enacted": "1997",
//           "description":
//               "create standard for validating recently enacted acts",
//           "content": <String, dynamic>{"script": "", "pdf": ""}
//         },
//         "Administration Of Justice Commission Act": {
//           "cover": AssetImage(
//               'lib/Resources/Media/Photos/Background/background9.png'),
//           "date-enacted": "1997",
//           "description":
//               "create standard for validating recently enacted acts",
//           "content": <String, dynamic>{"script": "", "pdf": ""}
//         },
//         "Admiralty Jurisdiction Act": {
//           "cover": AssetImage(
//               'lib/Resources/Media/Photos/Background/background10.jpg'),
//           "date-enacted": "1997",
//           "description":
//               "create standard for validating recently enacted acts",
//           "content": <String, dynamic>{"script": "", "pdf": ""}
//         },
//       },
//     },
//     "Criminal": <String, dynamic>{
//       "icon": Icons.local_police_rounded,
//       "books": {
//         "Administrative Guidelines For Commissioner For Oaths": {
//           "cover": AssetImage(
//               'lib/Resources/Media/Photos/Background/background10.jpg'),
//           "date-enacted": "1997",
//           "description":
//               "create standard for validating recently enacted acts",
//           "content": <String, dynamic>{"script": "", "pdf": ""}
//         },
//         "Administrative Staff College Of Nigeria Act": {
//           "cover": AssetImage(
//               'lib/Resources/Media/Photos/Background/background10.jpg'),
//           "date-enacted": "1997",
//           "description":
//               "create standard for validating recently enacted acts",
//           "content": <String, dynamic>{"script": "", "pdf": ""}
//         },
//       }
//     },
// "Commercial": <dynamic, dynamic>{
//   "icon": Icons.money,
//   "books": [
//     {
//       "title": "Advertising Practitioner’s (Registration, Etc.) Act",
//       "cover": AssetImage(
//           'lib/Resources/Media/Photos/Background/background10.jpg'),
//       "date-enacted": "1997",
//       "description":
//           "create standard for validating recently enacted acts",
//     },
//   ],
// },
// "Labour": <dynamic, dynamic>{
//   "icon": Icons.handyman_rounded,
//   "books": [""],
// },
// "Health": <dynamic, dynamic>{
//   "icon": Icons.medical_services_rounded,
//   "books": [""],
// },
// "Civil": <dynamic, dynamic>{
//   "icon": Icons.engineering_rounded,
//   "books": [""],
// },
// "Banking": <dynamic, dynamic>{
//   "icon": Icons.branding_watermark,
//   "books": [""],
// },
// "Mining": <dynamic, dynamic>{
//   "icon": Icons.landscape_rounded,
//   "books": [""],
// },
// "Tax": <dynamic, dynamic>{
//   "icon": Icons.attach_money_rounded,
//   "books": [""],
// },
// "Energy": <dynamic, dynamic>{
//   "icon": Icons.battery_full_rounded,
//   "books": [""],
// },

// /
//
//
//
//
//
//
//
//
// /
// import 'package:flutter/material.dart';
// import 'package:legal_authority/Pages/Reader/Reader.dart';
// import 'package:legal_authority/Resources/Resources.dart';
// import 'package:legal_authority/Widgets/BookCover.dart';
// import 'package:legal_authority/Widgets/TabButton.dart';
// import 'package:legal_authority/Widgets/Functional/TopTabBar.dart';

// class ActsOfTheFederation extends StatefulWidget {
//   final String title;
//   final Map tabs;

//   const ActsOfTheFederation({this.title, this.tabs});

//   @override
//   _ActsOfTheFederationState createState() => _ActsOfTheFederationState();
// }

// class _ActsOfTheFederationState extends State<ActsOfTheFederation> {
//   PageController _pageTab;

//   List<Widget> bruh = [];

//   void _openBook(title, description, content) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => Reader(
//                 title: title, description: description, content: content)));
//   }

//   void _selectTab(name) {
//     setState(() {
//       switch (name) {
//         case "substantive":
//           _pageTab.animateToPage(0, duration: pageDuration, curve: pageCurve);
//           break;
//         case "procedural":
//           _pageTab.animateToPage(1, duration: pageDuration, curve: pageCurve);
//           break;
//         case "amendments":
//           _pageTab.animateToPage(2, duration: pageDuration, curve: pageCurve);
//           break;
//       }
//     });
//   }

//   List _getTiles(String tab) {
//     List<Widget> tiles = [];

//     switch (tab) {
//       case "substantive":
//         widget.tabs.forEach((k, v) => v.forEach((k, v) => v.forEach((k, v) {
//               tiles.add(ExpansionTile(
//                   title: Text(k, style: Theme.of(context).textTheme.headline),
//                   trailing: Icon(v["icon"], color: Colors.blue),
//                   childrenPadding: EdgeInsets.all(20),
//                   children: [
//                     GridView.count(
//                         shrinkWrap: true,
//                         physics: ClampingScrollPhysics(),
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 25,
//                         childAspectRatio: 0.65,
//                         children: v["books"]
//                             .map<Widget>((book) => BookCover(
//                                 title: book["title"],
//                                 image: book["cover"],
//                                 description: book["description"],
//                                 openBook: _openBook))
//                             .toList())
//                   ]));
//             })));

//         return tiles;
//         break;
//       default:
//         return [];
//     }
//   }

//   Widget _getPages(pos) {
//     switch (pos) {
//       case 0:
//         return Padding(
//             padding: EdgeInsets.only(top: 10),
//             child: ListView(children: [
//               // ExpansionTile(
//               //     tilePadding: EdgeInsets.symmetric(horizontal: 20),
//               //     childrenPadding: EdgeInsets.only(left: 20, right: 5),
//               //     title: Text("Categories..",
//               //         style: Theme.of(context).textTheme.headline2.copyWith(
//               //             fontSize: 15,
//               //             fontFamily: "Sailor",
//               //             letterSpacing: 2.8)),
//               //     children: _getTiles("substantive")),
//               // Divider(color: Colors.blue, height: 30),
//               // Padding(
//               //     padding: EdgeInsets.only(top: 20, left: 30, bottom: 30),
//               //     child: Text("Full List..",
//               //         style: Theme.of(context).textTheme.headline2.copyWith(
//               //             fontSize: 15,
//               //             fontFamily: "Sailor",
//               //             letterSpacing: 2.8))),
//               Padding(
//                   padding: EdgeInsets.only(right: 18, left: 18, top: 0),
//                   child: GridView.count(
//                       shrinkWrap: true,
//                       physics: ClampingScrollPhysics(),
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 25,
//                       childAspectRatio: 0.65,
//                       children: List.generate(
//                           30,
//                           (index) => BookCover(
//                               from: "full", title: index.toString()))))
//             ]));
//         break;
//       case 1:
//         return Padding(
//             padding: EdgeInsets.only(top: 10, right: 20, left: 20),
//             child: GridView.count(
//                 shrinkWrap: true,
//                 physics: ClampingScrollPhysics(),
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 25,
//                 childAspectRatio: 0.65,
//                 children: []));
//         break;
//       case 2:
//         return Padding(
//             padding: EdgeInsets.only(top: 10, right: 20, left: 20),
//             child: GridView.count(
//                 shrinkWrap: true,
//                 physics: ClampingScrollPhysics(),
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 25,
//                 childAspectRatio: 0.65,
//                 children: []));
//         break;
//     }

//     return Text("Error!");
//   }

//   @override
//   void initState() {
//     super.initState();

//     _pageTab = PageController(initialPage: 0);
//   }

//   void tester() {
//     bruh = widget.tabs.entries
//         .map<Widget>((e) => e.value.entries
//             .map<Widget>((e) => e.value.entries
//                 .map<Widget>((e) =>
//                     e.value.entries.map((e) => Text(e.toString())).toList())
//                 .toList())
//             .toList())
//         .toList();

//     print("bruh is $bruh");

//     //  widget.tabs.forEach((k, v) => v.forEach((k, v) => v.forEach((k, v) {
//     //       bruh = v.entries.map<Widget>((e) => Text(e.toString())).toList();
//     //     })));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Column(children: [
//         Padding(
//             padding: EdgeInsets.only(top: 20),
//             child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   RaisedButton(
//                       shape: CircleBorder(),
//                       color: Theme.of(context).buttonColor,
//                       onPressed: () => Navigator.pop(context),
//                       child: Icon(Icons.arrow_back,
//                           size: 15, color: Theme.of(context).iconTheme.color)),
//                   Text(widget.title,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2
//                           .copyWith(fontSize: 13)),
//                   RaisedButton(
//                       shape: CircleBorder(),
//                       color: Theme.of(context).buttonColor,
//                       onPressed: () {},
//                       child: Icon(Icons.search,
//                           size: 16, color: Theme.of(context).iconTheme.color))
//                 ])),
//         SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.symmetric(vertical: 20),
//                 child: TopTabBar()
//                 // Row(
//                 //     children: widget.tabs.entries
//                 //         .map((e) => TabButton(
//                 //             name: e.key, selectTab: _selectTab, ctrl: _pageTab))
//                 //         .toList())

//                 )),
//         Expanded(
//             child: PageView.builder(
//                 controller: _pageTab,
//                 itemBuilder: (ctxt, pos) => _getPages(pos),
//                 itemCount: 3))
//       ]),
//       // floatingActionButton: FloatingActionButton(onPressed: () => tester()),
//     ));
//   }
// }
