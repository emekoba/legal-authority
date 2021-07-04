// import 'package:flutter/material.dart';

// class Dict extends StatefulWidget {
//   final Map result;

//   Dict({this.result});

//   @override
//   _DictState createState() => _DictState();
// }

// class _DictState extends State<Dict> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: DefaultTabController(
//         length: 4,
//         child: CustomScrollView(slivers: [
//           SliverAppBar(
//               shape: RoundedRectangleBorder(
//                   borderRadius:
//                       BorderRadius.only(bottomLeft: Radius.circular(30))),
//               // backgroundColor: Color(0xffD4344C),
//               backgroundColor: Color(0xff4a4a58),
//               elevation: 0,
//               pinned: true,
//               expandedHeight: 280,
//               bottom: TabBar(
//                   labelColor: Colors.black,
//                   indicatorColor: Colors.transparent,
//                   tabs: [
//                     // tabBox(name: "private"),
//                     Tab(child: Text("hey")),
//                     // tabBox(name: "shared"),
//                     Tab(child: Text("hey")),
//                     // tabBox(name: "public"),
//                     Tab(child: Text("hey")),
//                     // tabBox(name: "saved"),
//                     Tab(child: Text("hey")),
//                   ]),
//               flexibleSpace: FlexibleSpaceBar(
//                   centerTitle: true,
//                   title: Container(
//                       padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
//                       child: Column(children: [
//                         Text("ab initio",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontFamily: "Emporia",
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1.8)),
//                         // SizedBox(height: 50),
//                         // Row(
//                         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //     children: [
//                         //       headerButton(),
//                         //       headerButton(),
//                         //       headerButton(),
//                         //       headerButton()
//                         //     ])
//                       ])))),
//           SliverList(
//               delegate: SliverChildListDelegate(
//                   List.generate(10, (index) => Container(height: 550))))
//         ]),
//       ),
//     ));
//   }
// }
// // GestureDetector(
// //     onTap: () => _openSearch(),
// //     child: Container(
// //         height: 50,
// //         alignment: Alignment.centerRight,
// //         margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
// //         padding: EdgeInsets.only(right: 15),
// //         decoration: const BoxDecoration(
// //             color: Theme.of(context).accentColor,
// //             borderRadius: BorderRadius.all(Radius.circular(8))),
// //         child: Icon(Icons.search, color: Theme.of(context).buttonColor))),

// Widget tabBox({name}) {
//   return (Container(
//     width: 200,
//     padding: EdgeInsets.only(top: 13, bottom: 13),
//     child: Center(child: Text(name, style: TextStyle(fontSize: 11))),
//     decoration: const BoxDecoration(
//       color: Colors.grey[200],
//       borderRadius: BorderRadius.all(
//         Radius.circular(23),
//       ),
//     ),
//   ));
// }

// Widget headerButton() {
//   return GestureDetector(
//     onTap: () {},
//     child: Container(
//       height: 45,
//       width: 45,
//       decoration: const BoxDecoration(
//           color: Colors.grey.withOpacity(0.45),
//           borderRadius: BorderRadius.all(Radius.circular(5))),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.speaker, size: 18),
//           SizedBox(height: 5),
//           Text("pronounce", style: TextStyle(fontSize: 5)),
//         ],
//       ),
//     ),
//   );
// }

// // import 'package:flutter/material.dart';
// // import 'package:legal_authority/Pages/Dictionary/ResultPage.dart';
// // import 'package:legal_authority/Pages/Dictionary/Word.dart';

// // class Dictionary extends StatefulWidget {
// //   @override
// //   _DictionaryState createState() => _DictionaryState();
// // }

// // class _DictionaryState extends State<Dictionary> {
// //   List<String> letters = ["A", "B", "C", "D"];

// //   void _openPage(name) {}

// //   @override
// //   void initState() {
// //     super.initState();
// //     // _openResult();
// //   }

// //   void _openResult() {
// //     Navigator.push(
// //         context, MaterialPageRoute(builder: (context) => ResultPage()));
// //   }

// //   void _saveResult(result, page) {
// //     Scaffold.of(context).showSnackBar(SnackBar(
// //         content: Text("saved $result to $page"),
// //         action: SnackBarAction(
// //             label: "undo", textColor: Colors.red, onPressed: () {})));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //         child: Scaffold(
// //             body: SingleChildScrollView(
// //                 child: Padding(
// //                     padding: EdgeInsets.only(top: 10, left: 10, right: 10),
// //                     child: Column(children: [
// //                       dictButton(
// //                           context,
// //                           "History",
// //                           Icon(Icons.history,
// //                               size: 33, color: Theme.of(context).buttonColor),
// //                           _openPage),
// //                       SizedBox(height: 10),
// //                       dictButton(
// //                           context,
// //                           "Word of the day",
// //                           Icon(Icons.calendar_today,
// //                               size: 28, color: Theme.of(context).buttonColor),
// //                           _openPage),
// //                       SizedBox(height: 10),
// //                       Column(
// //                           children: letters
// //                               .map<Widget>((e) => ExpansionTile(
// //                                   initiallyExpanded: e == "B" ? true : false,
// //                                   tilePadding:
// //                                       EdgeInsets.only(left: 22, right: 17),
// //                                   title: Text(e,
// //                                       style: Theme.of(context)
// //                                           .textTheme
// //                                           .headline2
// //                                           .copyWith(
// //                                               fontSize: 20,
// //                                               letterSpacing: 1.8)),
// //                                   children: List.generate(
// //                                       30,
// //                                       (index) => Word(
// //                                           result: index.toString(),
// //                                           openResult: _openResult,
// //                                           saveResult: _saveResult))))
// //                               .toList())
// //                     ])))));
// //   }
// // }

// // Widget dictButton(context, name, icon, openPage) {
// //   return (InkWell(
// //       onTap: () => openPage(name),
// //       child: Padding(
// //           padding: const EdgeInsets.all(15),
// //           child: Row(children: [
// //             icon,
// //             SizedBox(width: 20),
// //             Text(name,
// //                 style: TextStyle(
// //                     fontSize: 15, letterSpacing: 1.5, fontFamily: "Emporia"))
// //           ]))));
// // }
