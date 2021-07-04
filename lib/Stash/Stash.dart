// import 'package:flutter/material.dart';

// class Stash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//  Container(
//                 decoration: BoxDecoration(
//                     color: Color(0xfff6f5f1),
//                     borderRadius: BorderRadius.circular(16)),
//                 child: Stack(children: [
//                   Container(
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                         Expanded(
//                             // flex: 2,
//                             child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context).accentColor,
//                                     // borderRadius: BorderRadius.circular(15)
//                                     borderRadius: BorderRadius.only(
//                                         topRight: Radius.circular(15),
//                                         topLeft: Radius.circular(15))),
//                                 margin: const EdgeInsets.all(0),
//                                 padding: EdgeInsets.symmetric(horizontal: 10),
//                                 child: Center(
//                                     child: Text(title,
//                                         textAlign: TextAlign.center,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headline4
//                                             .copyWith(
//                                                 fontSize: 14,
//                                                 letterSpacing: 1.5,
//                                                 height: 1.8))))),
//                         Expanded(child: Container())
//                       ])),
//                   Positioned(
//                       top: 0,
//                       right: 0,
//                       child: Container(
//                           height: 35,
//                           width: 35,
//                           decoration: BoxDecoration(
//                               color: Theme.of(context).buttonColor,
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(15),
//                                   bottomLeft: Radius.circular(15))),
//                           child: IconButton(
//                               icon: Icon(Icons.bookmark_border_rounded,
//                                   color: Theme.of(context).iconTheme.color),
//                               iconSize: 16,
//                               onPressed: () {}))),
//                 ]))
// DefaultTabController(
//         length: 4,
//         child: Scaffold(
// floatingActionButton: FloatingActionButton(
//     onPressed: _newForumItem,
//     backgroundColor: Theme.of(context).buttonColor,
//     child:
//         Icon(Icons.add, color: Theme.of(context).iconTheme.color)),
//             appBar: AppBar(
//                 leading: Offstage(),
//                 flexibleSpace:
//                     Column(mainAxisAlignment: MainAxisAlignment.end, children: [
//                   Padding(
//                       padding: const EdgeInsets.only(bottom: 8),
//                       child: TabBar(
//                           indicatorColor: Colors.transparent,
//                           unselectedLabelColor: Theme.of(context).accentColor,
//                           labelColor: Theme.of(context).buttonColor,
//                           tabs: [
//                             Tab(icon: Icon(Icons.receipt, size: 23)),
//                             Tab(
//                                 icon:
//                                     Icon(FontAwesomeIcons.newspaper, size: 22)),
//                             Tab(icon: Icon(FontAwesomeIcons.folder, size: 22)),
//                             Tab(icon: Icon(Icons.comment, size: 25))
//                           ]))
//                 ])),
//             body: TabBarView(children: [
// Container(
//     child: Center(child: Text("blogs opened/ interacted with"))),
// SubCategory(
//     user: widget.user,
//     subCategory:
//         widget.forums.where("createdBy", isEqualTo: fire_user)),
// SubCategory(
//     user: widget.user,
//     subCategory: widget.forums
//         .where("subscribers", arrayContains: fire_user)),
// Container(child: Center(child: Text("replies/comments"))),
//             ])));

//     return StreamBuilder<dynamic>(
//         stream: widget.blogsCollection.collection("comments").snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return SliverToBoxAdapter(child: Container());
//           }

//           QuerySnapshot _comments = snapshot.data as QuerySnapshot;

//           return ListView.builder(
//               itemCount: _comments.docs.length,
//               itemBuilder: (context, index) {
// if (index == 0) {
//   return SliverToBoxAdapter(
//       child: Container(
//           alignment: Alignment.centerRight,
//           child: InkWell(
//               onTap: _toggleCommentSection,
//               child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Text("Comments",
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline6
//                           .copyWith(
//                               fontSize: 18,
//                               color: Theme.of(context)
//                                   .buttonColor))))));
// }

// index -= 1;

//                 return StreamBuilder<dynamic>(
//                     stream: widget.usersCollection
//                         .doc(_comments.docs[index]["commenter"] as String)
//                         .snapshots(),
//                     builder: (context, usersnapshot) {
//                       if (!usersnapshot.hasData) {
//                         return Offstage();
//                       }
//                       DocumentSnapshot _users_docs =
//                           usersnapshot.data as DocumentSnapshot;

//                       print(_users_docs["username"] as String);

//                       return Comment(
//                           commentCollection:
//                               widget.blogsCollection.collection("comments"),
//                           comment: _comments.docs[index].id,
//                           username: _users_docs["username"] as String,
//                           occupation: _users_docs["occupation"] as String,
//                           institution: _users_docs["institutionName"] as String,
//                           country: _users_docs["country"] as String,
//                           level: _users_docs["levelInInstitution"] as String);
//                     });
//               });
//         });
//   }
// }

//
//
//
//
//
//
//
//
//
// return SliverList(
//     delegate: SliverChildBuilderDelegate((context, index) {
// if (index == 0) {
//   return SliverToBoxAdapter(
//       child: Container(
//           alignment: Alignment.centerRight,
//           child: InkWell(
//               onTap: _toggleCommentSection,
//               child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Text("Comments",
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline6
//                           .copyWith(
//                               fontSize: 18,
//                               color: Theme.of(context).buttonColor))))));
// }
// index -= 1;

//   return SliverToBoxAdapter();

// return SliverOffstage(
//   offstage: !_commentSectionIsOpen,
//   sliver: StreamBuilder<dynamic>(
//       stream: widget.blogsCollection.collection("comments").snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Offstage();
//         }

//         _comments = snapshot.data as QuerySnapshot;

//         return StreamBuilder<dynamic>(
//             stream: widget.usersCollection
//                 .doc(_comments.docs[index]["commenter"] as String)
//                 .snapshots(),
//             builder: (context, usersnapshot) {
//               if (!usersnapshot.hasData) {
//                 return Offstage();
//               }

//               DocumentSnapshot _users_docs =
//                   usersnapshot.data as DocumentSnapshot;

//               return Comment(
//                   commentCollection:
//                       widget.blogsCollection.collection("comments"),
//                   comment: _comments.docs[index].id,
//                   username: _users_docs["username"] as String,
//                   occupation: _users_docs["occupation"] as String,
//                   institution: _users_docs["institutionName"] as String,
//                   country: _users_docs["country"] as String,
//                   level: _users_docs["levelInInstitution"] as String);
//             });
//       }),
// );
// }, childCount: 1));
// Widget timelineTile() {
//   String gibberish =
//       "descriptionfcgvhbjnkml,;mknjbhvgcfxdzsdxfcgvhbjnkml,,kmnbgvfcdxszasxdcfvgbhnjmk,lkmjnbhgvfcdxszasxdcfvgbhnjmk,ldescriptionfcgvhbjnkml,;mknjbhvgcfxdzsdxfcgvhbjnkml,,kmnbgvfcdxszasxdcfvgbhnjmk,lkmjnbhgvfcdxszasxdcfvgbhnjmk,l";

//   IndicatorStyle _indicator = IndicatorStyle(
//       width: 40,
//       height: 40,
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       indicator: IconButton(
//           icon: Icon(
//               _inLibrary
//                   ? Icons.bookmark_rounded
//                   : Icons.bookmark_border_rounded,
//               color: Theme.of(context).buttonColor),
//           iconSize: 17,
//           onPressed: _saveToLibrary));

//   LineStyle _line =
//       LineStyle(color: Theme.of(context).accentColor, thickness: 3);

//   TimelineTile _leftTile = TimelineTile(
//       alignment: TimelineAlign.manual,
//       lineXY: 0,
//       // isFirst: isFirst,
//       // isLast: isLast,
//       indicatorStyle: _indicator,
//       beforeLineStyle: _line,
//       endChild: GestureDetector(
//           // onTap: _openLessonPage,
//           child: Container(
//               padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("lesson",
//                         style: Theme.of(context)
//                             .textTheme
//                             .headline6
//                             .copyWith(fontSize: 13)),
//                     Text("description" ?? "",
//                         style: Theme.of(context)
//                             .textTheme
//                             .headline4
//                             .copyWith(fontSize: 12))
//                   ]))));

//   TimelineTile _rightTile = TimelineTile(
//       alignment: TimelineAlign.manual,
//       lineXY: 1,
//       // isFirst: isFirst,
//       // isLast: isLast,
//       beforeLineStyle: _line,
//       afterLineStyle: _line,
//       indicatorStyle: _indicator,
//       startChild: GestureDetector(
//           // onTap: _openLessonPage,
//           child: Container(
//               padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text("lesson",
//                         style: Theme.of(context)
//                             .textTheme
//                             .headline6
//                             .copyWith(fontSize: 13)),
//                     Text("description" ?? "",
//                         style: Theme.of(context)
//                             .textTheme
//                             .headline4
//                             .copyWith(fontSize: 12))
//                   ]))));

//   Map lessons = <String, dynamic>{};

//   String course = "";

//   String _lessonPostPosition = "right";

//   int _lessonPostIndex = 0;

//   TimelineDivider _divide = TimelineDivider(
//       begin: 0.05,
//       end: 0.95,
//       thickness: 3,
//       color: Theme.of(context).accentColor);

//   return ListView.builder(
//       itemCount: lessons.length,
//       itemBuilder: (context, index) {
//         dynamic key = lessons.keys.elementAt(index);

//         bool first = false;
//         bool last = false;

//         first = _lessonPostIndex == 0 ? true : false;

//         last = _lessonPostIndex + 1 == lessons.length ? true : false;

//         _lessonPostIndex += 1;

//         _lessonPostPosition =
//             _lessonPostPosition == "left" ? "right" : "left";

//         return Column(children: [
//           // LessonPost(
//           //     course: course,
//           //     lesson: key.toString(),
//           //     description: lessons[key]["description"].toString(),
//           //     position: _lessonPostPosition,
//           //     isFirst: first,
//           //     isLast: last),
//           last ? Offstage() : _divide
//         ]);
//       });
// }

// return GestureDetector(
//     onTap: _goToForum,
//     child: Container(
//         margin: EdgeInsets.only(bottom: 20),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Theme.of(context).primaryColor,
//             border:
//                 Border.all(width: 1, color: Theme.of(context).accentColor)),
//         padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
//         child:
//     Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//   Text(title,
//       style: Theme.of(context).textTheme.headline6.copyWith(
//           height: 1.8,
//           fontSize: 15,
//           // letterSpacing: 0.8,
//           color: Theme.of(context).buttonColor)),
//   SizedBox(height: 20),
//   Text(description,
//       style: Theme.of(context)
//           .textTheme
//           .headline6
//           .copyWith(fontSize: 15))
// ])));
//  void _init_aotf() {
//  Map _user = <String, dynamic>{
// "name": "Baron Emekoba",

// "id": "0329r4583543879",

// "email": "klojett.re@gmail.com",

// "typeOfUser": "", //? gov, organisation

// "profile": "lib/Resources/Profile/dp.jpeg",

// "country": "Nigeria",

// "occupation": "Lawyer", //? lawyer, lecturer, student

// "institutionType": "chamber", //? court, chamber, university, office

// "institutionName": "Patrick Ocheja Okolo and co. legal practitioners",

// "levelInInstitution": "intern" //? 300lvl, chief barrister,
// };
// class Act2 extends StatelessWidget {
//   final String title;
//   final String description;
//   final String enacted;
//   final Map<String, IconData> tagsList;
//   final String tabName;
//   final Function saveToLibrary;
//   final Function saveToWorkStation;

//   Act2(
//       {this.title,
//       this.description,
//       this.enacted,
//       this.tabName,
//       this.saveToLibrary,
//       this.saveToWorkStation,
//       this.tagsList});

//   @override
//   Widget build(BuildContext context) {
//     final LawsAndDocsBloc lawsAndDocsBloc =
//         Provider.of<LawsAndDocsBloc>(context);

//     bool _inLibrary =
//         lawsAndDocsBloc.aotf[tabName][title]["isSavedToLibrary"] as bool;

//     bool _inWorkstation =
//         lawsAndDocsBloc.aotf[tabName][title]["isSavedToWorkstation"] as bool;

//     TextSpan _titleText = TextSpan(
//         text: title,
//         style: Theme.of(context)
//             .textTheme
//             .headline6
//             .copyWith(color: Colors.amberAccent, fontSize: 15));

//     TextStyle _richTextStyle =
//         Theme.of(context).textTheme.headline6.copyWith(fontSize: 11);

//     const Map<String, IconData> _tagsList = {
//       // "company": Icons.backpack,
//     };

//     void _saveToLibrary() {
//       lawsAndDocsBloc.toggleSaveItem(
//           saveTo: "library",
//           lawGroup: "aotf",
//           tab: tabName,
//           title: title,
//           currentSaveStateOfItem: _inLibrary);

//       Scaffold.of(context).showSnackBar(SnackBar(
//           backgroundColor: Theme.of(context).accentColor,
//           content: RichText(
//               text: TextSpan(children: [
//             TextSpan(
//                 text: _inLibrary ? "removed   " : "saved   ",
//                 style: TextStyle(color: Colors.white)),
//             _titleText,
//             TextSpan(
//                 text: _inLibrary ? "   from library" : "   to library",
//                 style: TextStyle(color: Colors.white))
//           ], style: _richTextStyle)),
//           action: SnackBarAction(
//               label: "undo", textColor: Colors.red, onPressed: () {})));
//     }

//     void _saveToWorkStation() {
//       lawsAndDocsBloc.toggleSaveItem(
//           saveTo: "workstation",
//           lawGroup: "aotf",
//           tab: tabName,
//           title: title,
//           currentSaveStateOfItem: _inLibrary);

//       Scaffold.of(context).showSnackBar(SnackBar(
//           backgroundColor: Theme.of(context).accentColor,
//           content: RichText(
//               text: TextSpan(children: [
//             TextSpan(
//                 text: _inWorkstation ? "removed   " : "saved   ",
//                 style: TextStyle(color: Colors.white)),
//             _titleText,
//             TextSpan(
//                 text: _inWorkstation
//                     ? "   from workstation"
//                     : "   to workstation",
//                 style: TextStyle(color: Colors.white))
//           ], style: _richTextStyle)),
//           action: SnackBarAction(
//               label: "undo", textColor: Colors.red, onPressed: () {})));
//     }

//     return Container(
//         constraints: BoxConstraints(minHeight: 80),
//         margin: EdgeInsets.only(left: 0, bottom: 20, right: 20),
//         decoration: BoxDecoration(
//             // borderRadius: BorderRadius.circular(10),
//             border: Border(
//                 left: BorderSide.none,
//                 // left:
//                 //     BorderSide(width: 1, color: Theme.of(context).accentColor),
//                 right:
//                     BorderSide(width: 1, color: Theme.of(context).accentColor),
//                 top: BorderSide(width: 1, color: Theme.of(context).accentColor),
//                 bottom: BorderSide(
//                     width: 1, color: Theme.of(context).accentColor))),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Expanded(
//                 child: Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//                     child: Text("${title}  (${enacted})",
//                         style: Theme.of(context).textTheme.headline6.copyWith(
//                               fontSize: 15,
//                               height: 1.5,
//                               letterSpacing: 0.5,
//                             )))),
//             Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Tooltip(
//                       message: "save to workstation",
//                       preferBelow: false,
//                       margin: EdgeInsets.only(right: 30),
//                       child: InkWell(
//                           onTap: _saveToWorkStation,
//                           child: Container(
//                               height: 40,
//                               width: 40,
//                               color: Theme.of(context).accentColor,
//                               child: Icon(
//                                   _inWorkstation
//                                       ? Icons.edit
//                                       : Icons.edit_outlined,
//                                   color: Theme.of(context).buttonColor,
//                                   size: 16)))),
//                   Tooltip(
//                       message: "save to library",
//                       preferBelow: false,
//                       margin: EdgeInsets.only(right: 30),
//                       child: InkWell(
//                           onTap: _saveToLibrary,
//                           child: Container(
//                               height: 40,
//                               width: 40,
//                               color: Theme.of(context).accentColor,
//                               child: Icon(
//                                   _inLibrary
//                                       ? Icons.bookmark_rounded
//                                       : Icons.bookmark_border_rounded,
//                                   color: Theme.of(context).buttonColor,
//                                   size: 16))))
//                 ])
//           ]),
//           Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Wrap(
//                   children: _tagsList.entries
//                       .map((e) => BoxChip(
//                           backgroundColor: Theme.of(context).accentColor,
//                           label: Text(e.key,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline6
//                                   .copyWith(fontSize: 10))))
//                       .toList())),
//           Padding(
//               padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
//               child: Text(description,
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline6
//                       .copyWith(fontSize: 12, height: 1.4)))
//         ]));
//   }
// }

// class CommentType2 extends StatelessWidget {
//   final String comment;
//   final String username;

//   const CommentType2({this.comment, this.username});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(width: 1, color: Theme.of(context).accentColor)),
//         padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
//         margin: EdgeInsets.only(bottom: 25),
//         child: Row(children: [
//           // Container(
//           //     height: 80,
//           //     width: 10,
//           //     color: Theme.of(context).buttonColor),
//           // SizedBox(width: 20),
//           Expanded(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(username,
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline4
//                               .copyWith(fontSize: 12)),
//                       SizedBox(width: 20),
//                       FittedBox(
//                           child: CircleAvatar(
//                               backgroundColor: Colors.grey[200],
//                               backgroundImage: AssetImage(
//                                   "lib/Resources/Profile/Profile2.jpg"),
//                               minRadius: 13))
//                     ]),
//                 Container(
//                     padding: EdgeInsets.symmetric(vertical: 20),
//                     constraints: BoxConstraints(minHeight: 80),
//                     child: Text(comment,
//                         style: Theme.of(context)
//                             .textTheme
//                             .headline4
//                             .copyWith(fontSize: 12))),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text("7h", style: TextStyle(fontSize: 10)),
//                       SizedBox(width: 20),
//                       Text("Unical Class of 2018",
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline4
//                               .copyWith(fontSize: 12))
//                     ])
//               ]))
//         ]));
//   }
// }

// header
//     ? InkWell(
//         onTap: () => _expandCategory(subCategory),
//         child: Container(
//             width: double.infinity,
//             height: 50,
//             child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(subCategory.toUpperCase(),
//                           style: TextStyle(
//                               fontSize: 12, fontWeight: FontWeight.bold)),
//                       SizedBox(width: 15),
//                       Icon(
//                           subCategory == "created"
//                               ? Icons.create_new_folder
//                               : Icons.add,
//                           size: 15,
//                           color: Theme.of(context).buttonColor)
//                     ]))))
//     : Offstage(),

// class Mine extends StatelessWidget {
//   final Function expand;
//   final String user;

//   const Mine({this.expand, this.user});

//   @override
//   Widget build(BuildContext context) {
//     void _newForumItem() {
//       showModalBottomSheet<Widget>(
//           backgroundColor: Theme.of(context).primaryColor,
//           isScrollControlled: true,
//           context: context,
//           builder: (BuildContext context) {
//             return NewForumModal();
//           });
//     }

//     return Scaffold(
//         floatingActionButton: Padding(
//             padding: EdgeInsets.only(right: 10, bottom: 20),
//             child: FloatingActionButton(
//                 onPressed: _newForumItem,
//                 backgroundColor: Theme.of(context).buttonColor,
//                 child:
//                     Icon(Icons.add, color: Theme.of(context).iconTheme.color))),
//         body: ListView(children: [
//           ExpansionTile(
//               // initiallyExpanded: true,
//               tilePadding: const EdgeInsets.symmetric(horizontal: 20),
//               childrenPadding: const EdgeInsets.only(bottom: 20),
//               title: Row(children: [
//                 Text("REPLIES",
//                     style:
//                         TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//                 SizedBox(width: 15),
//                 Icon(Icons.mark_chat_read_rounded,
//                     size: 15, color: Theme.of(context).buttonColor)
//               ]),
//               children: List.generate(5, (index) => Replies())),
//           ExpansionTile(
//               initiallyExpanded: true,
//               tilePadding: const EdgeInsets.symmetric(horizontal: 20),
//               childrenPadding: const EdgeInsets.only(top: 20),
//               title: Row(children: [
//                 Text("FORUMS",
//                     style:
//                         TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//                 SizedBox(width: 15),
//                 Icon(Icons.web, size: 15, color: Theme.of(context).buttonColor)
//               ]),
//               children: [
//                 SubCategory(user: user, subCategory: "created"),
//                 SubCategory(user: user, subCategory: "subscribed"),
//               ]),
//           InkWell(
//               onTap: () => expand("blogs"),
//               child: Container(
//                   width: double.infinity,
//                   height: 50,
//                   child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(children: [
//                         Text("BLOGS",
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.bold)),
//                         SizedBox(width: 15),
//                         Icon(Icons.text_snippet_rounded,
//                             size: 15, color: Theme.of(context).buttonColor)
//                       ])))),
//           Container(height: 300)
//         ]));
//   }
// }

// void add(String page, String epsilon, String title, String description,
//     String enacted) {
//   _recentPage = page;

//   _core_library[title] = <String, String>{
//     "description": description,
//     "enacted": enacted
//   };

//   notifyListeners();
// }

// void remove(String page, String epsilon, String title, String description,
//     String enacted) {
//   _core_library.remove(title);

//   notifyListeners();
// }

// void undo(String epsilon) {
//   //epsilon is the tab that should be undone
// }

//     //todo: this will get the laws from the online database and load into core

//     //? but for now i will turn it off and just use hard copies of the docs

// String _tab;
// String _title;
// String _description;
// String _enacted;
// dynamic _content;
// Map _law = <String, dynamic>{};

// database_AOTF.forEach((String key, dynamic value) {
//   _tab = key;

//   value.forEach((String key, dynamic value) {
//     _title = key;
//     _description = value["description"].toString();
//     _enacted = value["enacted"].toString();
//     _content = value["content"];

//     _law[_title] = <String, dynamic>{
//       "description": _description,
//       "enacted": _enacted,
//       "content": _content,
//       "isSavedToLibrary": false,
//       "isSavedToWorkstation": false
//     };
//   });

//   _core_lawsAndDocs["aotf"][_tab] = _law;

//   _law = <String, dynamic>{};
// });
// }
// return CustomScrollView(slivers: [
// PageHeader.sliver(
//     // title: title,
//     icon: Icons.arrow_back,
//     onLeadingIconTapped: () => Navigator.pop(context)),
// SliverList(
//     delegate: SliverChildListDelegate([
//   Padding(
//       padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//                 padding: const EdgeInsets.only(
//                     left: 8, bottom: 10),
//                 child: Text(title,
//                     style: Theme.of(context)
//                         .textTheme
//                         .headline6
//                         .copyWith(fontSize: 18))),
//             Divider(color: Theme.of(context).buttonColor),
//           ])),
//   Padding(
//       padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//       child: Text(description,
//           style: Theme.of(context)
//               .textTheme
//               .headline6
//               .copyWith(fontSize: 16))),
//     Container(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: ListView.builder(
//             itemCount: snapshot.data.documents.length as int,
//             itemBuilder: (context, index) {
//               DocumentSnapshot _comments = snapshot
//                   .data.documents[index] as DocumentSnapshot;

//               // return BlogPost(
//               //     forum: forumName,
//               //     content: _blogs_docs["content"] as String,
//               //     title: _blogs_docs.id,
//               //     description: _blogs_docs["description"] as String);

//               return Container(
//                 height: 60,
//                 width: 60,
//                 color: Colors.red,
//               );
//             }))
//   ]))
// ]);

// import 'package:flutter/material.dart';
// import 'package:legal_authority/Pages/Forums/Blog/Comment.dart';

// class BlogPage extends StatelessWidget {
//   final String title;
//   final String forum;
//   final int score;

//   const BlogPage({this.title, this.forum, this.score});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: CustomScrollView(slivers: [
//       SliverAppBar(
//           // title: Text(title,
//           //     style:
//           //         Theme.of(context).textTheme.headline2.copyWith(fontSize: 14)),
//           elevation: 0,
//           expandedHeight: 300,
//           pinned: true,
//           actions: [
//             Padding(
//                 padding: const EdgeInsets.only(right: 8),
//                 child: Tooltip(
//                   message: "Share",
//                   child: IconButton(
//                       icon: Icon(Icons.share_rounded), onPressed: () {}),
//                 ))
//           ],
//           flexibleSpace: FlexibleSpaceBar(
//               collapseMode: CollapseMode.parallax,
//               title: Text(title,
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline4
//                       .copyWith(fontSize: 20)),
//               // centerTitle: true,
//               background: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 // child: Center(
//                 //     child: Text(title,
//                 //         // "A typical modern Public General Act consists of the following parts: title; year and chapter number; purpose of the Act; date of Royal Assent; body of the Act, in sections, and if the Act is long, also in parts; interpretation and commencement sections; schedule providing information about repeals and amendments resulting from the Act.",
//                 //         style: Theme.of(context).textTheme.headline4.copyWith(
//                 //             fontSize: 35, letterSpacing: 1, height: 1.5)))
//               )),
//           bottom: PreferredSize(
//               preferredSize: Size(double.infinity, 80),
//               child: Container(
//                   height: 80,
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(20),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(children: [
//                           Container(
//                               width: 50,
//                               decoration: BoxDecoration(
//                                   color: Theme.of(context).accentColor,
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: InkWell(
//                                   onTap: () {},
//                                   child: Padding(
//                                       padding: const EdgeInsets.all(8),
//                                       child: Icon(Icons.bookmark_border_rounded,
//                                           size: 20, color: Colors.white)))),
//                           SizedBox(width: 20),
//                           Container(
//                               width: 60,
//                               decoration: BoxDecoration(
//                                   color: Theme.of(context).accentColor,
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: InkWell(
//                                   onTap: () {},
//                                   child: Padding(
//                                       padding: const EdgeInsets.all(8),
//                                       child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Icon(
//                                                 Icons
//                                                     .chat_bubble_outline_rounded,
//                                                 size: 20,
//                                                 color: Colors.white),
//                                             Text('24k',
//                                                 style: TextStyle(fontSize: 11))
//                                           ]))))
//                         ]),
//                         Container(
//                             width: 120,
//                             decoration: BoxDecoration(
//                                 color: Theme.of(context).accentColor,
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   InkWell(
//                                       onTap: () {},
//                                       child: Padding(
//                                           padding: const EdgeInsets.all(8),
//                                           child: Icon(
//                                               Icons.arrow_upward_rounded,
//                                               size: 20,
//                                               color: Colors.white))),
//                                   Container(
//                                       margin: const EdgeInsets.symmetric(
//                                           horizontal: 10),
//                                       child: Text('24k',
//                                           style: TextStyle(fontSize: 11))),
//                                   InkWell(
//                                       onTap: () {},
//                                       child: Padding(
//                                           padding: const EdgeInsets.all(8),
//                                           child: Icon(
//                                               Icons.arrow_downward_rounded,
//                                               size: 20,
//                                               color: Colors.white)))
//                                 ]))
//                       ])))),
//       SliverList(
//           delegate:
//               SliverChildListDelegate(List.generate(20, (index) => Comment())))
//     ]));
//   }
// }

// bottomNavigationBar: Container(
//       margin: EdgeInsets.all(15.0),
//       height: 61,
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(35.0),
//                 boxShadow: [
//                   BoxShadow(
//                       offset: Offset(0, 3), blurRadius: 5, color: Colors.grey)
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   IconButton(
//                       icon: Icon(
//                         Icons.face,
//                         color: Colors.blueAccent,
//                       ),
//                       onPressed: () {}),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                           hintText: "Type Something...",
//                           hintStyle: TextStyle(color: Colors.blueAccent),
//                           border: InputBorder.none),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.photo_camera, color: Colors.blueAccent),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.attach_file, color: Colors.blueAccent),
//                     onPressed: () {},
//                   )
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(width: 15),
//           Container(
//             padding: const EdgeInsets.all(15.0),
//             decoration: BoxDecoration(
//                 color: Colors.blueAccent, shape: BoxShape.circle),
//             child: InkWell(
//               child: Icon(
//                 Icons.keyboard_voice,
//                 color: Colors.white,
//               ),
//               onLongPress: () {},
//             ),
//           )
//         ],
//       ),
//     ),
// SliverList(
//     delegate:
//         SliverChildListDelegate(lessons.entries.map((dynamic e) {
//   bool first = false;
//   bool last = false;

//   first = _lessonPostIndex == 0 ? true : false;

//   last = _lessonPostIndex + 1 == lessons.length ? true : false;

//   _lessonPostIndex += 1;

//   _lessonPostPosition =
//       _lessonPostPosition == "left" ? "right" : "left";

//   return Column(children: [
//     LessonPost(
//         course: course,
//         lesson: e.key.toString(),
//         description: e.value["description"].toString(),
//         position: _lessonPostPosition,
//         isFirst: first,
//         isLast: last),
//     last ? Offstage() : _divide
//   ]);
// }).toList()))
// Map<String, Map> _all_forums = {
//   "unical class of 2018": <String, dynamic>{
//     "created": <String, dynamic>{
//       "by": "Russell J Emekoba",
//       "date": "DateTime (2014)"
//     },
//     "moderators": <String>[
//       "Russell J Emekoba",
//       "Baron"
//     ], //names are userId..iserId is a combination of name and university
//     "subscribers": <String>[
//       "Viscount",
//       "Nayomi"
//     ], //get number of subscribers programatically"score": 2430,
//     "blogs": <String, Map>{
//       "11 steps on how laws are made in Nigeria": <String, dynamic>{
//         "description": "blah fuckity blah blah",
//         "comments": <String, Map>{
//           "bro this will never work": <String, dynamic>{
//             "created": <String, dynamic>{
//               "by": "Ifeanyi Iwuchukwu",
//               "date": "DateTime(2014)",
//             },
//             "replies": <String, dynamic>{
//               "reply1": {""},
//               "reply2": {""}
//             }
//           }
//         }
//       }
//     },
//     "subscribed": false
//   },
//   "judicial scandals": <String, dynamic>{
//     "created": <String, dynamic>{
//       "by": "Russell J Emekoba",
//       "date": "DateTime (2014)"
//     },
//     "moderators": <String>[
//       "Russell J Emekoba",
//       "Baron"
//     ], //names are userId..iserId is a combination of name and university
//     "subscribers": <String>[
//       "Viscount",
//       "Nayomi"
//     ], //get number of subscribers programatically"score": 2430,
//     "blogs": <String, Map>{
//       "11 steps on how laws are made in Nigeria": <String, dynamic>{
//         "description": "blah fuckity blah blah",
//         "comments": <String, Map>{
//           "bro this will never work": <String, dynamic>{
//             "created": <String, dynamic>{
//               "by": "Ifeanyi Iwuchukwu",
//               "date": "DateTime(2014)",
//             },
//             "replies": <String, dynamic>{
//               "reply1": {""},
//               "reply2": {""}
//             }
//           }
//         }
//       }
//     },
//     "subscribed": false
//   },
//   "moot court": <String, dynamic>{
//     "created": <String, dynamic>{
//       "by": "Russell J Emekoba",
//       "date": "DateTime (2014)"
//     },
//     "moderators": <String>[
//       "Russell J Emekoba",
//       "Baron"
//     ], //names are userId..iserId is a combination of name and university
//     "subscribers": <String>[
//       "Viscount",
//       "Nayomi"
//     ], //get number of subscribers programatically"score": 2430,
//     "blogs": <String, Map>{
//       "11 steps on how laws are made in Nigeria": <String, dynamic>{
//         "description": "blah fuckity blah blah",
//         "comments": <String, Map>{
//           "bro this will never work": <String, dynamic>{
//             "created": <String, dynamic>{
//               "by": "Ifeanyi Iwuchukwu",
//               "date": "DateTime(2014)",
//             },
//             "replies": <String, dynamic>{
//               "reply1": {""},
//               "reply2": {""}
//             }
//           }
//         }
//       }
//     },
//     "subscribed": false
//   },
//   "favorite law books": <String, dynamic>{
//     "created": <String, dynamic>{
//       "by": "Russell J Emekoba",
//       "date": "DateTime (2014)"
//     },
//     "moderators": <String>[
//       "Russell J Emekoba",
//       "Baron"
//     ], //names are userId..iserId is a combination of name and university
//     "subscribers": <String>[
//       "Viscount",
//       "Nayomi"
//     ], //get number of subscribers programatically"score": 2430,
//     "blogs": <String, Map>{
//       "11 steps on how laws are made in Nigeria": <String, dynamic>{
//         "description": "blah fuckity blah blah",
//         "comments": <String, Map>{
//           "bro this will never work": <String, dynamic>{
//             "created": <String, dynamic>{
//               "by": "Ifeanyi Iwuchukwu",
//               "date": "DateTime(2014)",
//             },
//             "replies": <String, dynamic>{
//               "reply1": {""},
//               "reply2": {""}
//             }
//           }
//         }
//       }
//     },
//     "subscribed": false
//   },
//   "interesting medical malpractises": <String, dynamic>{
//     "created": <String, dynamic>{
//       "by": "Russell J Emekoba",
//       "date": "DateTime (2014)"
//     },
//     "moderators": <String>[
//       "Russell J Emekoba",
//       "Baron"
//     ], //names are userId..iserId is a combination of name and university
//     "subscribers": <String>[
//       "Viscount",
//       "Nayomi"
//     ], //get number of subscribers programatically"score": 2430,
//     "blogs": <String, Map>{
//       "11 steps on how laws are made in Nigeria": <String, dynamic>{
//         "description": "blah fuckity blah blah",
//         "comments": <String, Map>{
//           "bro this will never work": <String, dynamic>{
//             "created": <String, dynamic>{
//               "by": "Ifeanyi Iwuchukwu",
//               "date": "DateTime(2014)",
//             },
//             "replies": <String, dynamic>{
//               "reply1": {""},
//               "reply2": {""}
//             }
//           }
//         }
//       }
//     },
//     "subscribed": false
//   },
//   "rare law terms": <String, dynamic>{
//     "created": <String, dynamic>{
//       "by": "Russell J Emekoba",
//       "date": "DateTime (2014)"
//     },
//     "moderators": <String>[
//       "Russell J Emekoba",
//       "Baron"
//     ], //names are userId..iserId is a combination of name and university
//     "subscribers": <String>[
//       "Viscount",
//       "Nayomi"
//     ], //get number of subscribers programatically"score": 2430,
//     "blogs": <String, Map>{
//       "11 steps on how laws are made in Nigeria": <String, dynamic>{
//         "description": "blah fuckity blah blah",
//         "comments": <String, Map>{
//           "bro this will never work": <String, dynamic>{
//             "created": <String, dynamic>{
//               "by": "Ifeanyi Iwuchukwu",
//               "date": "DateTime(2014)",
//             },
//             "replies": <String, dynamic>{
//               "reply1": {""},
//               "reply2": {""}
//             }
//           }
//         }
//       }
//     },
//     "subscribed": false
//   },
//   "nbx guild": <String, dynamic>{
//     "created": <String, dynamic>{
//       "by": "Russell J Emekoba",
//       "date": "DateTime (2014)"
//     },
//     "moderators": <String>[
//       "Russell J Emekoba",
//       "Baron"
//     ], //names are userId..iserId is a combination of name and university
//     "subscribers": <String>[
//       "Viscount",
//       "Nayomi"
//     ], //get number of subscribers programatically"score": 2430,
//     "blogs": <String, Map>{
//       "11 steps on how laws are made in Nigeria": <String, dynamic>{
//         "description": "blah fuckity blah blah",
//         "comments": <String, Map>{
//           "bro this will never work": <String, dynamic>{
//             "created": <String, dynamic>{
//               "by": "Ifeanyi Iwuchukwu",
//               "date": "DateTime(2014)",
//             },
//             "replies": <String, dynamic>{
//               "reply1": {""},
//               "reply2": {""}
//             }
//           }
//         }
//       }
//     },
//     "subscribed": false
//   },
//   "sia matrix": <String, dynamic>{
//     "created": <String, dynamic>{
//       "by": "Russell J Emekoba",
//       "date": "DateTime (2014)"
//     },
//     "moderators": <String>[
//       "Russell J Emekoba",
//       "Baron"
//     ], //names are userId..iserId is a combination of name and university
//     "subscribers": <String>[
//       "Viscount",
//       "Nayomi"
//     ], //get number of subscribers programatically"score": 2430,
//     "blogs": <String, Map>{
//       "11 steps on how laws are made in Nigeria": <String, dynamic>{
//         "description": "blah fuckity blah blah",
//         "comments": <String, Map>{
//           "bro this will never work": <String, dynamic>{
//             "created": <String, dynamic>{
//               "by": "Ifeanyi Iwuchukwu",
//               "date": "DateTime(2014)",
//             },
//             "replies": <String, dynamic>{
//               "reply1": {""},
//               "reply2": {""}
//             }
//           }
//         }
//       }
//     },
//     "subscribed": false
//   },
// };

// Map<String, Map> _core_profile = {
//   "Russell Emekoba": <String, dynamic>{
//     "created": <String>[
//       "unical class of 2018",
//       "judicial scandals",
//       "moot court",
//       "favorite law books",
//       "interesting medical malpractises",
//       "rare law terms"
//     ],
//     "subscribed": <String>["nbx guild", "sia matrix"]
//   },
//   "Nayomi Tommy": <String, dynamic>{
//     "created": <String>[
//       "unical class of 2018",
//       "judicial scandals",
//       "moot court",
//       "favorite law books",
//       "interesting medical malpractises",
//       "rare law terms"
//     ],
//     "subscribed": <String>["judicial scandals", "moot court"]
//   },
// };

// Map<String, Map> _user_stats = {
//   "Russell Emekoba": <String, dynamic>{
//     "nation": "Nigeria",
//     "occupation": "lawyer",
//     "institution": {
//       "chamber": {
//         "patrick ocheja okolo and co. legal practitioners": "intern"
//       }
//     }
//   },
//   "Nayomi Tommy": <String, dynamic>{
//     "nation": "Nigeria",
//     "occupation": "student",
//     "institution": {
//       "university": {"university of calabar": "500lvl"}
//     }
//   },
//   "Baron Emekoba": <String, dynamic>{
//     "nation": "Ghana",
//     "occupation": "lecturer",
//     "institution": {
//       "lecturer": {"university of ghana": "criminal law"}
//     }
//   },
//   "Ifeanyi Iwuchukwu": <String, dynamic>{
//     "nation": "zimbabwe",
//     "occupation": "student",
//     "institution": {
//       "lecturer": {"university of kampala": "100lvl"}
//     }
//   },
// };

// floatingActionButton: Padding(
//     padding: EdgeInsets.only(right: 0, bottom: 0),
//     child: UnicornDialer(
//         hasBackground: false,
//         parentButtonBackground: Theme.of(context).accentColor,
//         parentButton:
//             Icon(Icons.add, color: Theme.of(context).iconTheme.color),
//         childButtons: [
//           UnicornButton(
//               labelHasShadow: false,
//               hasLabel: true,
//               labelText: "Exams",
//               currentButton: FloatingActionButton(
//                   heroTag: "exams",
//                   backgroundColor: Theme.of(context).buttonColor,
//                   mini: true,
//                   child: Icon(FontAwesomeIcons.handPaper,
//                       size: 16, color: Theme.of(context).iconTheme.color),
//                   onPressed: () {})),
//           UnicornButton(
//               labelHasShadow: false,
//               hasLabel: true,
//               labelText: "Homework",
//               currentButton: FloatingActionButton(
//                   heroTag: "homework",
//                   backgroundColor: Theme.of(context).buttonColor,
//                   mini: true,
//                   child: Icon(FontAwesomeIcons.home,
//                       size: 16, color: Theme.of(context).iconTheme.color),
//                   onPressed: () {}))
//         ])),

// case "dictionary":
//   return TextSpan(
//       recognizer: TapGestureRecognizer()
//         ..onTap = () => tap(type: page, word: text),
//       text: " $text ",
//       style: TextStyle(
//         // color: Colors.lightBlueAccent,
//         color: Colors.amberAccent,
//       ));
//   break;

// case "constitutions":
//   return TextSpan(
//       recognizer: TapGestureRecognizer()
//         ..onTap = () => tap(type: page, word: text),
//       text: " $text ",
//       style: TextStyle(color: Colors.amberAccent));
//   break;

//  SliverAppBar(
//                 elevation: 0,
//                 expandedHeight: 100,
//                 // expandedHeight: 80,
//                 floating: true,
//                 // backgroundColor: Colors.blue,
//                 leading: Offstage(),
//                 flexibleSpace: FlexibleSpaceBar(
//                     background: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                       Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             RaisedButton(
//                                 color: Theme.of(context).buttonColor,
//                                 shape: CircleBorder(),
//                                 onPressed: () => Navigator.pop(context),
//                                 child: Icon(Icons.arrow_back,
//                                     size: 18,
//                                     color: Theme.of(context).iconTheme.color)),
//                             Text("$course Law",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline6
//                                     .copyWith(
//                                         fontSize: 16,
//                                         color: Theme.of(context).accentColor))
//                           ]),
//                       InkWell(
//                           onTap: () {},
//                           child: Container(
//                               width: 60,
//                               height: 35,
//                               margin: EdgeInsets.only(right: 10),
//                               child: Center(
//                                   child: Text("Stats",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headline6
//                                           .copyWith(
//                                               fontSize: 16,
//                                               color: Theme.of(context)
//                                                   .buttonColor)))))
//                     ]))),

// floatingActionButton: _fabShown
//           ? Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20),
//               child: FloatingActionButton.extended(
//                   onPressed: _changeHomePage,
//                   backgroundColor: Theme.of(context).buttonColor,
//                   label: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text("",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headline6
//                                 .copyWith(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15,
//                                     color: Theme.of(context).primaryColor)),
//                         SizedBox(width: 10),
//                         Icon(Icons.arrow_forward_ios_rounded,
//                             size: 15, color: Theme.of(context).primaryColor)
//                       ])))
//           : Offstage(),
//       body: SafeArea(
//           child: Column(children: [
//         PageHeader(
//             title: widget.forumName,
//             titleStyle: Theme.of(context).textTheme.headline6.copyWith(
//                   fontSize: 16,
//                   // color: Theme.of(context).accentColor,
//                 ),
//             icon: Icons.arrow_back,
//             onLeadingIconTapped: () => Navigator.pop(context)),
//         Expanded(
//           child: PageView(
//               controller: _homePage,
//               onPageChanged: (index) => _toggleFabShown(index),
//               children: [
//                 Home(),
//                 Row(children: [
//                   Expanded(
//                       child: PageView(
//                           physics: NeverScrollableScrollPhysics(),
//                           controller: _page,
//                           onPageChanged: (index) => _changeSubPage(index),
//                           children: [
//                         ProfileList(title: widget.forumName),
//                         BlogList(title: widget.forumName)
//                       ])),
//                   SideTabBar(
//                       side: "right",
//                       control: _page,
//                       tabs: <String>["MEMBERS", "BLOGS"]),
//                 ])
//               ]),
//         )
//       ])),

//  void _changeHomePage() {
//     _homePage.jumpToPage(1);

//     _hideFab();
//   }

//   void _toggleFabShown(int index) {
//     if (index == 0) {
//       _showFab();
//     } else if (index == 1) {
//       _hideFab();
//     }
//   }

//   void _showFab() {
//     setState(() {
//       _fabShown = true;
//     });
//   }

//   void _hideFab() {
//     setState(() {
//       _fabShown = false;
//     });
//   }

// Scaffold(
//         body: Container(
//             height: MediaQuery.of(context).size.height,
//             child: Column(children: [
//               Expanded(
//                   child: CustomScrollView(slivers: [
//                 SliverAppBar(
//                     elevation: 0,
//                     expandedHeight: 330,
//                     pinned: true,
//                     centerTitle: true,
//                     flexibleSpace: FlexibleSpaceBar(
//                         centerTitle: true,
//                         background: FittedBox(
//                             fit: BoxFit.cover,
//                             child: Image.asset(
//                                 "lib/Resources/Media/Photos/Background/background4.jpg")))),
//                 SliverList(
//                     delegate: SliverChildListDelegate([
//                   Container(
//                       padding: const EdgeInsets.all(20),
//                       child: Column(children: [
//                         Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                   width: 60,
//                                   height: 80,
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(10),
//                                       child: FittedBox(
//                                           fit: BoxFit.cover,
//                                           child: Image.asset(
//                                               "lib/Resources/Media/Photos/Background/background2.jpg")))),
//                               SizedBox(width: 30),
//                               Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text("Unical class of 2018",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headline2
//                                             .copyWith(fontSize: 14)),
//                                     SizedBox(height: 10),
//                                     Text("created   2014",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headline4
//                                             .copyWith(
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.bold))
//                                   ])
//                             ]),
//                         SizedBox(height: 30),
// Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Row(children: [
//         Icon(Icons.supervised_user_circle_rounded,
//             color: Theme.of(context).buttonColor),
//         SizedBox(width: 20),
//         Text("Members",
//             style: Theme.of(context)
//                 .textTheme
//                 .headline4
//                 .copyWith(
//                     fontSize: 13,
//                     fontWeight: FontWeight.bold)),
//         SizedBox(width: 20),
//         Text("270",
//             style: Theme.of(context)
//                 .textTheme
//                 .headline4
//                 .copyWith(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold))
//       ]),
//       AvatarList(size: 11, number: 3)
//     ]),
//                         SizedBox(height: 20),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(children: [
//                                 Icon(Icons.gavel_rounded,
//                                     color: Theme.of(context).buttonColor),
//                                 SizedBox(width: 20),
//                                 Text("Moderator(s)",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headline4
//                                         .copyWith(
//                                             fontSize: 13,
//                                             fontWeight: FontWeight.bold)),
//                                 SizedBox(width: 20),
//                                 Text("2",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headline4
//                                         .copyWith(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold)),
//                                 SizedBox(width: 20)
//                               ]),
//                               AvatarList(size: 11, number: 2)
//                             ]),
//                         SizedBox(height: 20),
//                         Row(children: [
//                           Icon(Icons.text_snippet_rounded,
//                               color: Theme.of(context).buttonColor),
//                           SizedBox(width: 20),
//                           Text("Blogs",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline4
//                                   .copyWith(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.bold)),
//                           SizedBox(width: 20),
//                           Text("30",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline4
//                                   .copyWith(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold))
//                         ])
//                       ])),
//                   Container(
//                       height: 1000,
//                       child: PageView(controller: _page, children: [
//                         Expanded(
//                             child: Container(
//                                 // color: Colors.blueAccent,
//                                 child: Column(children: [
//                           ...List.generate(
//                               2,
//                               (index) => Container(
//                                     height: 200,
//                                     // color: Colors.blueAccent,
//                                   ))
//                         ]))),
//                         Container(
//                             child: Column(children: [
//                           ...List.generate(
//                               2,
//                               (index) => Container(
//                                     height: 200,
//                                     // color: Colors.redAccent
//                                   ))
//                         ]))
//                       ]))
//                 ]))
//               ])),
//               Container(
//                   margin: const EdgeInsets.only(top: 20, bottom: 20),
//                   child: TopTabBar(
//                       tabs: <String>["Blogs", "Members"],
//                       control: _page,
//                       changeTab: _changeTab))
//             ])));

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:legal_authority/Pages/Forums/Feed/ForumFeed.dart';
// import 'package:legal_authority/Pages/Forums/Private/Private.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';

class Forums extends StatefulWidget {
  final Function openSidebar;

  const Forums({this.openSidebar});

  @override
  _ForumsState createState() => _ForumsState();
}

class _ForumsState extends State<Forums> {
  PageController _page = PageController();

  int _pageIndex = 0;

  bool _isLoading = false;

  void _changePage(int index) {
    _page.jumpToPage(index);

    setState(() {
      _pageIndex = index;
    });
  }

  void _newforumItem(BuildContext context) {
    showModalBottomSheet<Widget>(
        backgroundColor: Theme.of(context).primaryColor,
        context: context,
        builder: (context) {
          return ForumModal();
        });
  }

  void _openSearch() {
    showModalBottomSheet<Widget>(
        backgroundColor: Theme.of(context).primaryColor,
        context: context,
        builder: (ctx) {
          return Container();
        });
  }

  void _actionPressed() {}

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: Random().nextInt(5000)), () {
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Tooltip(
      //     message: "create forum",
      //     preferBelow: false,
      //     margin: const EdgeInsets.only(right: 80),
      //     child: FloatingActionButton(
      //         backgroundColor: Theme.of(context).buttonColor,
      //         child:
      //             Icon(Icons.chat, color: Theme.of(context).iconTheme.color),
      //         onPressed: () => _newforumItem(context))),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        ActionBtn("library", Icons.bookmark, _actionPressed),
        SizedBox(height: 20),
        ActionBtn("workstation", Icons.edit_outlined, _actionPressed),
        SizedBox(height: 20),
        // ActionBtn("settings", Icons.settings, _actionPressed),
      ]),
      body: CustomScrollView(slivers: [
        PageHeader.sliver(
            title: "FORUMS",
            icon: Icons.web,
            onLeadingIconTapped: widget.openSidebar),
        _isLoading
            ? SliverFillRemaining(
                child: Center(
                    child: SpinKitFoldingCube(
                        size: 70, color: Theme.of(context).buttonColor)))
            : SliverFillRemaining(
                child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _page,
                    onPageChanged: (index) => _changePage(index),
                    children: [
                    // ForumFeed(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: _openSearch,
                              child: Container(
                                  height: 40,
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Row(children: [
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(left: 20),
                                            alignment: Alignment.centerLeft,
                                            child: Text("search..",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4
                                                    .copyWith(
                                                        fontSize: 10,
                                                        color: Colors.grey)))),
                                    Container(
                                        height: 48,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).buttonColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Icon(Icons.search,
                                            size: 19,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color))
                                  ]))),
                          SizedBox(height: 20),
                          Padding(
                              padding: const EdgeInsets.only(left: 28, top: 0),
                              child: Text("Top Forums",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          fontSize: 20,
                                          color:
                                              Theme.of(context).accentColor))),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Divider()),
                          GridView.count(
                              physics: ClampingScrollPhysics(),
                              crossAxisCount: 3,
                              childAspectRatio: 0.8,
                              mainAxisSpacing: 30,
                              crossAxisSpacing: 25,
                              shrinkWrap: true,
                              padding: EdgeInsets.all(25),
                              children:
                                  List.generate(7, (index) => Bruh(index)))
                        ]),
                    Container(),
                    // Private(),
                  ]))
      ]),
      bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
              selectedItemColor: Theme.of(context).buttonColor,
              unselectedItemColor: Theme.of(context).accentColor,
              currentIndex: _pageIndex,
              onTap: (index) => _changePage(index),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    label: "feed", icon: Icon(Icons.home_rounded)),
                BottomNavigationBarItem(
                    label: "search", icon: Icon(Icons.search_rounded)),
                BottomNavigationBarItem(
                    label: "brands", icon: Icon(Icons.text_snippet_rounded)),
                BottomNavigationBarItem(
                    label: "profile", icon: Icon(Icons.person))
              ])),
    );
  }
}

class Bruh extends StatelessWidget {
  final int index;

  const Bruh(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
            child: Container(
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     fit: BoxFit.cover,
                    //     image: AssetImage(
                    //         "lib/Resources/Media/Photos/Background/background8.jpg")),
                    // border: Border.all(
                    //     width: 1,
                    //     color: Colors
                    //         .amberAccent),
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10)))),
        SizedBox(height: 15),
        Text("unical class of 2018",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: 10, color: Colors.grey))
      ]),
    );
  }
}

class ForumModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 20),
              child: Row(children: [
                Text("NEW FORUM",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold)),
                SizedBox(width: 15),
                Icon(Icons.add, color: Theme.of(context).buttonColor)
              ])),
          Container(
            // color: Colors.red,
            // height: 200,
            child: TextFormField(),
          ),
        ]));
  }
}

class ActionBtn extends StatelessWidget {
  const ActionBtn(this.name, this.icon, this.actionPressed);

  final String name;
  final IconData icon;
  final Function actionPressed;

  @override
  Widget build(BuildContext context) {
    return (FloatingActionButton(
        heroTag: null,
        backgroundColor: Theme.of(context).buttonColor,
        mini: true,
        onPressed: () => actionPressed(name),
        child: Icon(icon, color: Theme.of(context).iconTheme.color, size: 15)));
  }
}

//  ExpansionTile(
//             initiallyExpanded: true,
//             tilePadding: const EdgeInsets.symmetric(horizontal: 30),
//             title: Text("Recently Visited Pages",
//                 style: Theme.of(context).textTheme.headline6.copyWith(
//                     fontSize: 20, color: Theme.of(context).accentColor)),
//             childrenPadding: EdgeInsets.all(20),
//             children: [
//               Container(
//                 // height: 600,
//                 child: ListView.builder(
//                     itemExtent: 11,
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
//                     itemCount: _pages.length,
//                     itemBuilder: (BuildContext context, int index) => Padding(
//                         padding: const EdgeInsets.only(bottom: 30),
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(_pages[index],
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headline6
//                                       .copyWith(fontSize: 15)),
//                               Text("${mainBloc.pages[_pages[index]]}",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headline6
//                                       .copyWith(
//                                           fontSize: 17,
//                                           color: Theme.of(context).buttonColor))
//                             ]))),
//               )
//             ]),
//  OptionBox(
//                 textBefore: "repeat",
//                 uniqueWidget: Padding(
//                     padding: const EdgeInsets.only(right: 30),
//                     child: Switch(
//                         activeColor: Theme.of(context).buttonColor,
//                         value: _repeatExam,
//                         onChanged: (value) => _toggleRepeat()))),

const Map<String, Map> database_lawsAndDocs = {
  "Acts Of The Federation": <String, dynamic>{
    "cover_image":
        AssetImage('lib/Resources/Media/Photos/Background/background1.jpg'),
    "tabs": {
      "substantive": <String, Map>{
        "categories": <String, Map>{
          "Company": <dynamic, dynamic>{
            "icon": Icons.business,
            "books": [""],
          },
          "Criminal": <dynamic, dynamic>{
            "icon": Icons.local_police_rounded,
            "books": [""],
          },
          "Commercial": <dynamic, dynamic>{
            "icon": Icons.money,
            "books": [""],
          },
          "Labour": <dynamic, dynamic>{
            "icon": Icons.handyman_rounded,
            "books": [""],
          },
          "Health": <dynamic, dynamic>{
            "icon": Icons.medical_services_rounded,
            "books": [""],
          },
          "Civil": <dynamic, dynamic>{
            "icon": Icons.engineering_rounded,
            "books": [""],
          },
          "Banking": <dynamic, dynamic>{
            "icon": Icons.branding_watermark,
            "books": [""],
          },
          "Mining": <dynamic, dynamic>{
            "icon": Icons.landscape_rounded,
            "books": [""],
          },
          "Tax": <dynamic, dynamic>{
            "icon": Icons.attach_money_rounded,
            "books": [""],
          },
          "Energy": <dynamic, dynamic>{
            "icon": Icons.battery_full_rounded,
            "books": [""],
          },
        }
      },
      "procedural": {""},
      "amendments": {""},
    }
  },
  "Constitutions": <String, dynamic>{
    "cover_image":
        AssetImage('lib/Resources/Media/Photos/Background/background8.jpg'),
  },
  "Law Reports": <String, dynamic>{
    "cover_image":
        AssetImage('lib/Resources/Media/Photos/Background/background4.jpg')
  },
  "Laws Of The Various States": <String, dynamic>{
    "cover_image":
        AssetImage('lib/Resources/Media/Photos/Background/background2.jpg'),
    "tabs": <String, Map>{
      "substantive": <String, Map>{
        "states": <String, Map>{
          "Abia": <String, dynamic>{
            "icon": Icons.business,
            "books": [
              {
                "title": "Acts Authentication Act",
                "cover": AssetImage(
                    'lib/Resources/Media/Photos/Background/background2.jpg'),
                "enacted": "1997",
                "description":
                    "create standard for validating recently enacted acts",
              },
              {
                "title": "Administration Of Justice Commission Act",
                "cover": AssetImage(
                    'lib/Resources/Media/Photos/Background/background9.png'),
                "enacted": "1997",
                "description":
                    "create standard for validating recently enacted acts",
              },
              {
                "title": "Admiralty Jurisdiction Act",
                "cover": AssetImage(
                    'lib/Resources/Media/Photos/Background/background10.jpg'),
                "enacted": "1997",
                "description":
                    "create standard for validating recently enacted acts",
              },
            ],
          },
          "Adamawa": <String, dynamic>{
            "icon": Icons.local_police_rounded,
            "books": [
              {
                "title": "Administrative Guidelines For Commissioner For Oaths",
                "cover": AssetImage(
                    'lib/Resources/Media/Photos/Background/background10.jpg'),
                "enacted": "1997",
                "description":
                    "create standard for validating recently enacted acts",
              },
              {
                "title": "Administrative Staff College Of Nigeria Act",
                "cover": AssetImage(
                    'lib/Resources/Media/Photos/Background/background10.jpg'),
                "enacted": "1997",
                "description":
                    "create standard for validating recently enacted acts",
              },
            ],
          },
          "Akwa_Ibom": <String, dynamic>{
            "icon": Icons.money,
            "books": [
              {
                "title": "Advertising Practitioner’s (Registration, Etc.) Act",
                "cover": AssetImage(
                    'lib/Resources/Media/Photos/Background/background10.jpg'),
                "enacted": "1997",
                "description":
                    "create standard for validating recently enacted acts",
              },
            ],
          },
          "Anambra": <String, dynamic>{
            "icon": Icons.money,
            "books": [
              {
                "title": "Advertising Practitioner’s (Registration, Etc.) Act",
                "cover": AssetImage(
                    'lib/Resources/Media/Photos/Background/background10.jpg'),
                "enacted": "1997",
                "description":
                    "create standard for validating recently enacted acts",
              },
            ],
          },
        }
      }
    }
  },
  "Rules Of Court": <String, dynamic>{
    "cover_image":
        AssetImage('lib/Resources/Media/Photos/Background/background3.jpg')
  },
  "Military Decrees and Edicts": <String, dynamic>{
    "cover_image":
        AssetImage('lib/Resources/Media/Photos/Background/background10.jpg')
  },
  "International Law": <String, dynamic>{
    "cover_image":
        AssetImage('lib/Resources/Media/Photos/Background/background5.jpg')
  },
  "Principles and Cases": <String, dynamic>{
    "cover_image":
        AssetImage('lib/Resources/Media/Photos/Background/background6.jpg')
  },
  "Legal Drafting": <String, dynamic>{
    "cover_image":
        AssetImage('lib/Resources/Media/Photos/Background/background7.jpg')
  },
};

//  LessonPost.grid(
//       title: "International Law",
//       img: AssetImage(
//           'lib/Resources/Media/Photos/Background/background1.jpg')),
//   LessonPost.grid(
//       title: "International Law",
//       img: AssetImage(
//           'lib/Resources/Media/Photos/Background/background2.jpg')),
//   LessonPost.grid(
//       title: "International Law",
//       img: AssetImage(
//           'lib/Resources/Media/Photos/Background/background3.jpg')),
//   LessonPost.grid(
//       title: "International Law",
//       img: AssetImage(
//           'lib/Resources/Media/Photos/Background/background4.jpg')),
//   LessonPost.grid(
//       title: "International Law",
//       img: AssetImage(
//           'lib/Resources/Media/Photos/Background/background5.jpg')),

// lessonpage
//
//
//
//
// CustomScrollView(slivers: [
//         SliverAppBar(
//             elevation: 0,
//             title: Text(widget.title, style: Styles.lesson_page_title),
//             expandedHeight: 330,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: true,
//                 background: FittedBox(
//                     fit: BoxFit.cover,
//                     child: Image.asset(
//                         "lib/Resources/Media/Photos/Background/background11.jpg"))),
//             bottom: PreferredSize(
//                 preferredSize: Size(double.infinity, 80),
//                 child: Padding(
//                     padding: EdgeInsets.only(bottom: 30),
//                     child: TopTabBar(
//                         tabs: <String>["Notes", "Video", "Audio", "Tests"],
//                         control: _page,
//                         changeTab: _changeTab)))),
//         SliverList(
//             delegate: SliverChildListDelegate([
//           Container(
//               height: 3000,
//               child: PageView(
//                   controller: _page,
//                   onPageChanged: (index) => _tabChanged(index),
//                   children: [
//                     Note(lesson: widget.title, isBulleted: isBulleted),
//                     Center(child: Text("video")),
//                     Center(child: Text("audio")),
//                     Center(child: Text("tests"))
//                   ]))
//         ]))
//       ]),
// wordpage
//
//
// class ActionBtn extends StatelessWidget {
//   const ActionBtn(this.name, this.icon, this.actionPressed);

//   final String name;
//   final IconData icon;
//   final Function actionPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       SizedBox(height: 20),
//       FloatingActionButton(
//           heroTag: null,
//           backgroundColor: Theme.of(context).buttonColor,
//           mini: true,
//           onPressed: () => actionPressed(name),
//           child: Icon(icon, color: Theme.of(context).iconTheme.color, size: 15))
//     ]);
//   }
// }

//lectures
//
// home
//
//  CustomScrollView(slivers: [
//           SliverAppBar(
//               elevation: 0,
//               expandedHeight: 80,
//               floating: true,
//               flexibleSpace: FlexibleSpaceBar(
//                   background: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                     Container(
//                         padding: const EdgeInsets.symmetric(vertical: 20),
//                         child: RaisedButton(
//                             color: Theme.of(context).buttonColor,
//                             shape: CircleBorder(),
//                             onPressed: () => widget.openSidebar(),
//                             child: Icon(Icons.laptop_mac_rounded,
//                                 size: 18,
//                                 color: Theme.of(context).iconTheme.color))),
//                     Text("LECTURES",
//                         style: TextStyle(
//                             fontSize: 13, fontWeight: FontWeight.bold))
//                   ]))),
//           _isLoading
//               ? SliverFillRemaining(
//                   child: Center(
//                       child: SpinKitFoldingCube(
//                           size: 70, color: Theme.of(context).buttonColor)))
//               : SliverFillRemaining(
//                   child: PageView(
//                       physics: NeverScrollableScrollPhysics(),
//                       controller: _page,
//                       onPageChanged: (index) => _changePage(index),
//                       children: [
//                       Home(widget.openSidebar),
//                       CourseList(widget.openSidebar)
//                     ]))
//         ]),

// InkWell(
//   onTap: _openLessonPage,
//   child: Container(
//       decoration: BoxDecoration(
//           color: Theme.of(context).accentColor,
//           borderRadius: BorderRadius.circular(15)),
//       child: Column(children: [
//         Expanded(
//             child: Stack(children: [
//           ClipRRect(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10)),
//               child: Image(
//                   image: img, fit: BoxFit.cover, width: double.infinity)),
//           Container(
//               decoration: BoxDecoration(
//                   color: Colors.white30.withOpacity(0.8),
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(10),
//                       topLeft: Radius.circular(10)))),
//           Padding(
//               padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                         child: Container(
//                             child: Text(
//                                 "International Criminal Responsibility",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline1
//                                     .copyWith(
//                                         fontSize: 25,
//                                         color: Colors.black,
//                                         letterSpacing: 1.8)))),
//                     GestureDetector(
//                         onTap: () {},
//                         child: Padding(
//                             padding:
//                                 const EdgeInsets.fromLTRB(0, 30, 0, 20),
//                             child: Container(
//                                 height: 45,
//                                 width: 150,
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10),
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context).accentColor,
//                                     borderRadius:
//                                         BorderRadius.circular(40)),
//                                 child: Row(children: [
//                                   Icon(Icons.play_arrow,
//                                       color: Theme.of(context).buttonColor)
//                                 ]))))
//                   ]))
//         ])),
//         Row(children: [
//           Expanded(
//               child: Container(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: Text(title,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2
//                           .copyWith(fontSize: 13)))),
//           Container(
//               height: 45,
//               width: 45,
//               child: IconButton(
//                   icon: Icon(Icons.bookmark_border_rounded,
//                       color: Theme.of(context).buttonColor),
//                   iconSize: 20,
//                   onPressed: () => _addToLibrary()))
//         ])
//       ])),
// );

//  Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Text("recent list",
//             style: TextStyle(
//                 letterSpacing: 1.5,
//                 height: 1.8,
//                 fontSize: 13,
//                 fontFamily: "ProximaNova-Bold",
//                 fontWeight: FontWeight.bold))),
//     SizedBox(height: 30),
//     SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//             children: List.generate(
//                 8,
//                 (index) =>
//                     BookCover(from: "library", title: index.toString())))),
//     SizedBox(height: 30)

// Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// TopTabBar.icon(tabs: [
//   Icons.dashboard,
//   Icons.edit_outlined,
//   Icons.laptop_mac_rounded,
//   Icons.web,
//   Icons.face_rounded
// ]),
//   Expanded(
//       child: Container(
//           padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
//           child: Column(
//               children: widget.dashboard
//                   .map((e) => BookCover(title: e))
//                   .toList())))
// ]);

// CustomScrollView(slivers: [
//   SliverAppBar(
//       elevation: 0,
//       expandedHeight: 80,
//       floating: true,
//       flexibleSpace: FlexibleSpaceBar(
//           background: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//             Container(
//                 padding: EdgeInsets.symmetric(vertical: 20),
//                 child: RaisedButton(
//                     color: Theme.of(context).buttonColor,
//                     shape: CircleBorder(),
//                     onPressed: () {
//                       setState(() {
//                         widget.anime.forward();
//                         widget.isSideBarOpen = true;
//                       });
//                     },
//                     child: Icon(_getIcon(),
//                         size: 18,
//                         color: Theme.of(context)
//                             .iconTheme
//                             .color))),
//             Text(widget.name,
//                 style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.bold))
//           ]))),
//   SliverList(
//       delegate: SliverChildListDelegate([
//     Expanded(child: Container(color: Colors.red)),
//   ]))

//   //  SliverFillRemaining(child: widget.page)
// ]),

// Dashboard(openSidebar: _openSidebar),

//  GridView.count(
//                           shrinkWrap: true,
//                           physics: ClampingScrollPhysics(),
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 20,
//                           mainAxisSpacing: 30,
//                           childAspectRatio: 0.63,
//                           padding: EdgeInsets.only(bottom: 30),
//                           children: courses
//                               .map((e) => Panel.lectures(
//                                   type: 1,
//                                   title: e,
//                                   img: AssetImage(
//                                       'lib/Resources/Media/Photos/Background/background${courses.indexOf(e) + 1}.jpg'),
//                                   openPage: _openCourse,
//                                   tabs: {}))
//                               .toList())

//  Padding(
//             padding: EdgeInsets.only(left: 18, bottom: 20),
//             child: Text("Glossary",
//                 style: Theme.of(context).textTheme.headline6.copyWith(
//                     fontSize: 20,
//                     fontFamily: "Sebino",
//                     color: Theme.of(context).accentColor))),
//         Divider(height: 0),
//         SizedBox(height: 20),
//         Padding(
//             padding: EdgeInsets.symmetric(horizontal: 18),
//             child: GridView.count(
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 crossAxisCount: 5,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20,
//                 children: alphabets.entries
//                     .map((e) =>
//                         letterBtn(context, e.key, e.value, _openGlossary))
//                     .toList())),
//         SizedBox(height: 100)

// Widget panel(ctx, title, icon, openGlossary) {
//   return GestureDetector(
//       onTap: () => openGlossary(title),
//       child: Stack(children: [
//         Container(
//             decoration: const BoxDecoration(
//                 color: Theme.of(ctx).accentColor,
//                 borderRadius: BorderRadius.circular(15)),
//             margin: EdgeInsets.only(bottom: 15),
//             child: Container(
//                 decoration: const BoxDecoration(
//                     // color: Color(0xff353544),
//                     color: Colors.black12,
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(15),
//                         topLeft: Radius.circular(15),
//                         bottomRight: Radius.circular(10),
//                         bottomLeft: Radius.circular(150))))),
//         Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Expanded(child: Center(child: icon)),
//           Padding(
//               padding: EdgeInsets.only(bottom: 30),
//               child: Text(title,
//                   style: Theme.of(ctx).textTheme.headline2.copyWith(
//                       letterSpacing: 1.8, fontSize: 20, color: Colors.white)))
//         ])
//       ]));
// }

// InkWell(
//       onTap: () {},
//       child: Container(
//           width: double.infinity,
//           height: 50,
//           child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
// child: Row(children: [
//   Text("REPLIES",
//       style:
//           TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//   SizedBox(width: 15),
//   Icon(Icons.mark_chat_read_rounded,
//       size: 15, color: Theme.of(context).buttonColor)
// ])))),
//   Divider(height: 25),
//   Container(
//       height: 200,
//       child: Column(children: [
// ...List.generate(
//     10, (index) => Container(height: 100, color: Colors.blue))
//       ])),
// InkWell(
//     onTap: () {},
//     child: Container(
//         width: double.infinity,
//         height: 50,
//         child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Row(children: [
//               Text("FORUMS subscribed",
//                   style:
//                       TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//               SizedBox(width: 15),
//               Icon(Icons.add,
//                   size: 15, color: Theme.of(context).buttonColor)
//             ])))),
// Divider(height: 25),
// Container(height: 100),
// InkWell(
//     onTap: () {},
//     child: Container(
//         width: double.infinity,
//         height: 50,
//         child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Row(children: [
//               Text("BLOGS",
//                   style:
//                       TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//               SizedBox(width: 15),
//               Icon(Icons.text_snippet_rounded,
//                   size: 15, color: Theme.of(context).buttonColor)
//             ])))),
// Divider(height: 25),
// Container(height: 100),

// Container(
//     padding: EdgeInsets.symmetric(horizontal: 15),
//     child: GridView.count(
//         physics: ClampingScrollPhysics(),
//         shrinkWrap: true,
//         crossAxisCount: 3,
//         childAspectRatio: 0.9,
//         crossAxisSpacing: 15,
//         children: List.generate(
//             4,
// (index) => Container(
//     decoration: const BoxDecoration(
//         color: Theme.of(context).accentColor,
//         borderRadius: BorderRadius.circular(10)),
//     margin: EdgeInsets.only(bottom: 15),
//     child: Container(
//         decoration: const BoxDecoration(
//             color: Color(0xff35354F),
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(10),
//                 topLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10),
//                 bottomLeft:
//                     Radius.circular(50)))))))),

// Center(
//               child: Column(children: [
//             Text("sort by university"),
//             Text("sort by forum with the most members"),
//             Text("check out blogger.com for template"),
//           ])),
// Container(
//     width: double.infinity,
//     child: Padding(
//         padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("TOP FORUMS",
//                   style: TextStyle(
//                       fontSize: 12, fontWeight: FontWeight.bold))
//             ]))),
// Divider(height: 60),
// Container(
//     child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//             children: List.generate(
//                 8,
//                 (index) => Container(
//                     height: 190,
//                     width: 150,
// decoration: const BoxDecoration(
//     color: Theme.of(context).accentColor,
//     borderRadius: BorderRadius.circular(10)),
//                     margin: EdgeInsets.symmetric(horizontal: 10),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: FittedBox(
//                           fit: BoxFit.cover,
//                           child: Image.asset(
//                               "lib/Resources/Media/Photos/Background/background${index + 1}.jpg")),
//                     )))))),

//  Material(
//                           // elevation: 4,
//                           shape: CircleBorder(),
//                           clipBehavior: Clip.hardEdge,
//                           color: Colors.transparent,
//                           child: InkWell(
//                               onTap: () {},
//                               child: Padding(
//                                   padding: EdgeInsets.all(8),
//                                   child: Icon(Icons.arrow_downward_rounded,
//                                       size: 20, color: Colors.white)))),

// switch (name) {
//   case "Acts Of The Federation":
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => ActsOfTheFederation(title: name)));
//     break;
//   case "Laws Of The Various States":
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => LawsOfTheVariousStates(title: name)));
//     break;
//   case "Rules Of Court":
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => RulesOfCourt(title: name)));
//     break;
//   case "International Law":
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => InternationalLaw(title: name)));
//     break;
//   case "Principles and Cases":
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => PrinciplesAndCases(title: name)));
//     break;
//   case "Military Decrees and Edicts":
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => MilitaryDecreesAndEdicts(title: name)));
//     break;
//   case "Legal Drafting":
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => LegalDrafting(title: name)));
//     break;
// }
// floatingActionButton: Padding(
//     padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
//     child: Tooltip(
//       preferBelow: false,
//       margin: EdgeInsets.only(right: 80),
//       message: "search for anything",
//       child: FloatingActionButton(
//           backgroundColor: Colors.blue,
//           child: Icon(Icons.search_rounded, color: Colors.white),
//           onPressed: () => _openSearch(context)),
//     )),
// bottomSheet: BottomSheet(
//   enableDrag: false,
//   builder: (context) => Search(),
//   onClosing: () {},
// )

// aotf
// .map((e) => ExpansionTile(
//         title: Text(e["name"],
//             style: TextStyle(
//                 fontSize: 13,
//                 fontFamily: "Emporia",
//                 letterSpacing: 2.8)),
//         trailing: Icon(e["icon"], color: Colors.blue),
//         childrenPadding: EdgeInsets.all(20),
//         children: [
//           GridView.count(
//               shrinkWrap: true,
//               physics: ClampingScrollPhysics(),
//               crossAxisCount: 2,
//               crossAxisSpacing: 25,
//               childAspectRatio: 0.65,
//               children: e["books"]
//                   .map<Widget>((book) => BookCover(
//                       title: book["title"],
//                       image: book["cover"],
//                       description: book["description"],
//                       openBook: _openBook))
//                   .toList())
//         ]))
// .toList()

// ExpansionPanelList(
//     expansionCallback: (int index, bool isExpanded) {
//       print(index);
//     },
//     children: [
//       ExpansionPanel(
//           isExpanded: true,
//           canTapOnHeader: true,
//           headerBuilder:
//               (BuildContext context, bool isExpanded) {
//             return ListTile(title: Text('Item 1'));
//           },
//           body: ListTile(
//               title: Text('Item 1 child'),
//               subtitle: Text('Details goes here'))),
//       ExpansionPanel(
//           isExpanded: true,
//           canTapOnHeader: true,
//           headerBuilder:
//               (BuildContext context, bool isExpanded) {
//             return ListTile(title: Text("commercial acts"));
//           },
//           body: Column(children: [
//             Container(height: 100, color: Colors.red),
//             Container(height: 100, color: Colors.blue),
//             Container(height: 100, color: Colors.green)
//           ]))
//     ])
//  Navigator.push(
//             context, ScaleRoute(page: ActsOfTheFederation(title: name)));
// CustomScrollView(slivers: [
//             SliverAppBar(
//                 title: Text(title,
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                 elevation: 0,
//                 floating: true,
//                 actions: [
//                   Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Icon(Icons.search_rounded))
//                 ]),
//             SliverList(
//                 delegate: SliverChildListDelegate([
//               Container(height: 300, color: Colors.blueGrey),
//               Padding(
//                   padding: EdgeInsets.only(top: 40, left: 20, right: 20),
//                   child: Column(children: books))
//             ]))
//           ])

// CustomScrollView(slivers: [
// SliverAppBar(
//     floating: true,
//     leading: Container(
//         padding: EdgeInsets.all(10),
//         child: InkWell(
//           onTap: () {
//             setState(() {
//               if (widget.isCollapsed)
//                 widget.shrink.forward();
//               else
//                 widget.shrink.reverse();

//               widget.isCollapsed = !widget.isCollapsed;
//             });
//           },
//           child: ClipOval(
//               child: Container(
//                   color: Colors.blue,
//                   child: Icon(Icons.menu, size: 15))),
//         )),
//     title: Row(
//       children: [
//         Text(widget.name,
//             style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.bold)),
//       ],
//     )),
//                       SliverList(
//                           delegate: SliverChildListDelegate([
//                         Container(
//                           color: Colors.redAccent,
//                           height: 400,
//                         ),
//                         Container(
//                           color: Colors.blueAccent,
//                           height: 400,
//                         ),
//                         Container(
//                           color: Colors.greenAccent,
//                           height: 400,
//                         )
//                       ]))
//                     ])

//  List<Widget> buttons = [
//       InkWell(
//           onTap: () => widget.changePage("DASHBOARD"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 55,
//               padding: EdgeInsets.all(20),
//               child: Text("DASHBOARD",
//                   style: TextStyle(
//                       fontFamily: "Paul",
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold)))),
//       InkWell(
//           onTap: () => widget.changePage("LIBRARY"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 55,
//               padding: EdgeInsets.all(20),
//               child: Text("LIBRARY",
//                   style: TextStyle(
//                       fontFamily: "Paul",
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold)))),
//       InkWell(
//           onTap: () => widget.changePage("LECTURES"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 55,
//               padding: EdgeInsets.all(20),
//               child: Text("LECTURES",
//                   style: TextStyle(
//                       fontFamily: "Paul",
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold)))),
//       InkWell(
//           onTap: () => widget.changePage("LAW REPORTS"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 55,
//               padding: EdgeInsets.all(20),
//               child: Text("LAW REPORTS",
//                   style: TextStyle(
//                       fontFamily: "Paul",
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold)))),
//       InkWell(
//           onTap: () => widget.changePage("STORE"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 55,
//               padding: EdgeInsets.all(20),
//               child: Text("STORE",
//                   style: TextStyle(
//                       fontFamily: "Paul",
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold)))),
//     ];

//  Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text("Recent",
//                   style:
//                       TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               InkWell(
//                   onTap: () {},
//                   child: Text("see more",
//                       style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.amberAccent)))
//             ]),
// Container(
//     height: 230,
//     margin: EdgeInsets.only(top: 30, bottom: 50),
//     child: ClipRRect(
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//       child: PageView(children: [
//         Image(
//             fit: BoxFit.cover,
//             image: AssetImage(
//                 'lib/Resources/Media/Photos/Background/background8.jpg')),
//         Image(
//             fit: BoxFit.cover,
//             image: AssetImage(
//                 'lib/Resources/Media/Photos/Background/background3.jpg'))
//       ]),
//     )),

// InkWell(
//     onTap: () => widget.changePage("LAWS OF THE FEDERATION"),
//     child: Container(
//         alignment: Alignment.centerLeft,
//         height: 50,
//         padding: EdgeInsets.all(20),
//         child: Text("LAWS OF THE FEDERATION",
//             style: TextStyle(
//                 fontFamily: "Paul",
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold)))),
// InkWell(
//     onTap: () => widget.changePage("LAWS OF THE VARIOUS STATES"),
//     child: Container(
//         alignment: Alignment.centerLeft,
//         height: 50,
//         padding: EdgeInsets.all(20),
//         child: Text("LAWS OF THE VARIOUS STATES",
//             style: TextStyle(
//                 fontFamily: "Paul",
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold)))),
// InkWell(
//     onTap: () => widget.changePage("RULES OF COURT"),
//     child: Container(
//         alignment: Alignment.centerLeft,
//         height: 50,
//         padding: EdgeInsets.all(20),
//         child: Text("RULES OF COURT",
//             style: TextStyle(
//                 fontFamily: "Paul",
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold)))),
// InkWell(
//     onTap: () => widget.changePage("INTERNATIONAL LAWS"),
//     child: Container(
//         alignment: Alignment.centerLeft,
//         height: 50,
//         padding: EdgeInsets.all(20),
//         child: Text("INTERNATIONAL LAWS",
//             style: TextStyle(
//                 fontFamily: "Paul",
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold)))),
// InkWell(
//     onTap: () => widget.changePage("RESEARCH MATERIALS"),
//     child: Container(
//         alignment: Alignment.centerLeft,
//         height: 50,
//         padding: EdgeInsets.all(20),
//         child: Text("RESEARCH MATERIALS",
//             style: TextStyle(
//                 fontFamily: "Paul",
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold)))),
/////////////////////////////////////
/////////////////////////////////////
////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
///
///
// case "LAWS OF THE FEDERATION":
//   _currentPage = ActsOfTheFederation();
//   break;
// case "LAWS OF THE VARIOUS STATES":
//   _currentPage = LawsOfTheVariousStates();
//   break;
// case "RULES OF COURT":
//   _currentPage = RulesOfCourt();
//   break;
// case "INTERNATIONAL LAWS":
//   _currentPage = InternationalLaw();
//   break;
// case "RESEARCH MATERIALS":
//   _currentPage = ResearchMaterials();
//   break;
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
/////////////////////////////////////
// InkWell(
//           onTap: () => widget.changePage("DASHBOARD"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 50,
//               padding: EdgeInsets.all(20),
//               child: Text("DASHBOARD",
//                   style:
//                       TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))),
//       InkWell(
//           onTap: () => widget.changePage("LIBRARY"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 50,
//               padding: EdgeInsets.all(20),
//               child: Text("LIBRARY",
//                   style:
//                       TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))),
//       InkWell(
//           onTap: () => widget.changePage("LAWS OF THE FEDERATION"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 50,
//               padding: EdgeInsets.all(20),
//               child: Text("LAWS OF THE FEDERATION",
//                   style:
//                       TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))),
//       InkWell(
//           onTap: () => widget.changePage("LAWS OF THE VARIOUS STATES"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 50,
//               padding: EdgeInsets.all(20),
//               child: Text("LAWS OF THE VARIOUS STATES",
//                   style:
//                       TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))),
//       InkWell(
//           onTap: () => widget.changePage("RULES OF COURT"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 50,
//               padding: EdgeInsets.all(20),
//               child: Text("RULES OF COURT",
//                   style:
//                       TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))),
//       InkWell(
//           onTap: () => widget.changePage("INTERNATIONAL LAWS"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 50,
//               padding: EdgeInsets.all(20),
//               child: Text("INTERNATIONAL LAWS",
//                   style:
//                       TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))),
//       InkWell(
//           onTap: () => widget.changePage("RESEARCH MATERIALS"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 50,
//               padding: EdgeInsets.all(20),
//               child: Text("RESEARCH MATERIALS",
//                   style:
//                       TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))),
//       InkWell(
//           onTap: () => widget.changePage("STORE"),
//           child: Container(
//               alignment: Alignment.centerLeft,
//               height: 50,
//               padding: EdgeInsets.all(20),
//               child: Text("STORE",
//                   style:
//                       TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))),
