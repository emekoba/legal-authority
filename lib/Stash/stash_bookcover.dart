// import 'package:flutter/material.dart';

// Column(children: [
//       // Divider(),
//       Stack(children: [
//         Container(
//             margin: EdgeInsets.only(bottom: 20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Theme.of(context).primaryColor,
//               border:
//                   Border.all(width: 1, color: Theme.of(context).accentColor),
//             ),
//             padding: const EdgeInsets.all(15),
//             child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Expanded(
//                   child: Column(children: [
//                 InkWell(
//                     onTap: () => openBlog(),
//                     child: Container(
//                         child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                           InkWell(
//                               onTap: () => openForum("unical class of 2018"),
//                               child: Container(
//                                   width: 40,
//                                   height: 50,
//                                   margin: const EdgeInsets.only(right: 20),
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(10),
//                                       child: FittedBox(
//                                           fit: BoxFit.cover,
//                                           child: Image.asset(
//                                               "lib/Resources/Media/Photos/Background/background${index + 1}.jpg"))))),
//                           Expanded(
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                 Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       InkWell(
//                                           onTap: () =>
//                                               openForum("unical class of 2018"),
//                                           child: Text("unical class of 2018",
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .headline4
//                                                   .copyWith(fontSize: 12))),
//                                       Text("4 hours ago",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .headline4
//                                               .copyWith(fontSize: 12)),
//                                       SizedBox()
//                                     ]),
//                                 SizedBox(height: 20),
//                                 Text(
//                                     "11 steps to how laws are made in Nigeria"
//                                         .toUpperCase(),
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 5,
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 13,
//                                         color: Theme.of(context).buttonColor)),
//                                 SizedBox(height: 10),
//                                 Container(
//                                     height: 100,
//                                     child: Text(description,
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 5,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headline4
//                                             .copyWith(fontSize: 15)))
//                               ]))
//                         ]))),
//                 SizedBox(height: 30),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(children: [
//                         Container(
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Theme.of(context).accentColor,
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: InkWell(
//                                 onTap: () {},
//                                 child: Padding(
//                                     padding: const EdgeInsets.all(8),
//                                     child: Icon(Icons.bookmark_border_rounded,
//                                         size: 20, color: Colors.white)))),
//                         SizedBox(width: 20),
//                         Container(
//                             width: 60,
//                             decoration: BoxDecoration(
//                                 color: Theme.of(context).accentColor,
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: InkWell(
//                                 onTap: () {},
//                                 child: Padding(
//                                     padding: const EdgeInsets.all(8),
//                                     child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Icon(
//                                               Icons.chat_bubble_outline_rounded,
//                                               size: 20,
//                                               color: Colors.white),
//                                           Text('24k',
//                                               style: TextStyle(fontSize: 11))
//                                         ]))))
//                       ]),
//                       Container(
//                           width: 120,
//                           decoration: BoxDecoration(
//                               color: Theme.of(context).accentColor,
//                               borderRadius: BorderRadius.circular(5)),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 InkWell(
//                                     onTap: _upvote,
//                                     child: Padding(
//                                         padding: const EdgeInsets.all(8),
//                                         child: Icon(Icons.arrow_upward_rounded,
//                                             size: 20, color: Colors.white))),
//                                 Container(
//                                     margin: const EdgeInsets.symmetric(
//                                         horizontal: 10),
//                                     child: Text('24k',
//                                         style: TextStyle(fontSize: 11))),
//                                 InkWell(
//                                     onTap: _downvote,
//                                     child: Padding(
//                                         padding: const EdgeInsets.all(8),
//                                         child: Icon(
//                                             Icons.arrow_downward_rounded,
//                                             size: 20,
//                                             color: Colors.white)))
//                               ]))
//                     ])
//               ]))
//             ])),
//         Positioned(
//             right: 0,
//             child: Tooltip(
//                 message: "add to library",
//                 preferBelow: false,
//                 child: IconButton(
//                     icon: Icon(Icons.share_rounded),
//                     iconSize: 18,
//                     color: Colors.white,
//                     onPressed: () => addToLibrary())))
//       ])
//     ]);

// class BookCover extends StatelessWidget {
//   BookCover(
//       {this.title,
//       this.image,
//       this.description,
//       this.content,
//       this.openBook,
//       this.from,
//       this.hasBeenOpened});

//   BookCover.expert(
//       {this.title,
//       this.image,
//       this.description,
//       this.content,
//       this.openBook,
//       this.from,
//       this.hasBeenOpened});

//   final AssetImage image;
//   final String description;
//   final String title;
//   final Function openBook;
//   final String from;
//   final bool hasBeenOpened;
//   final String content;

//   @override
//   Widget build(BuildContext context) {
//     const BoxDecoration book_decoration = const BoxDecoration(
//         // color: Theme.of(context).buttonColor,
//         color: Colors.amberAccent,
//         borderRadius: BorderRadius.all(Radius.circular(20)));

//     const BoxDecoration cover_decoration = const BoxDecoration(
//         color: Color(0xff35354F),
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//             bottomRight: Radius.circular(50)));

//     Center cover_text = Center(
//         child: Text(title,
//             style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 fontFamily: "ProximaNova-Extrabold",
//                 height: 2,
//                 letterSpacing: 1)));

//     return GestureDetector(
//         onTap: () => openBook(title, description, content),
//         child: from == "library"
//             ? Container(
//                 height: 200,
//                 width: 150,
//                 margin: EdgeInsets.only(left: 15, right: 5),
//                 decoration: book_decoration,
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                           width: 140,
//                           height: 180,
//                           decoration: cover_decoration,
//                           child: Padding(
//                               padding: EdgeInsets.only(left: 20, right: 20),
//                               child: cover_text))
//                     ]))
//             : Container(
//                 height: 200,
//                 width: 150,
//                 margin: EdgeInsets.only(bottom: 30),
//                 decoration: book_decoration,
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Container(
//                             width: from == "full" ? 165 : 150,
//                             decoration: cover_decoration,
//                             child: Padding(
//                                 padding: EdgeInsets.only(left: 20, right: 20),
//                                 child: cover_text)),
//                       ),
//                       Container(
//                           height: 40,
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Container(
//                                     width: 40,
//                                     height: 40,
//                                     decoration: const BoxDecoration(
//                                         color: Theme.of(context).buttonColor,
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(20),
//                                             bottomRight: Radius.circular(20))),
//                                     child: Tooltip(
//                                         message: "add doc to library",
//                                         child: IconButton(
//                                             icon: Icon(
//                                                 Icons.bookmark_border_rounded),
//                                             iconSize: 18,
//                                             color: Theme.of(context)
//                                                 .textTheme
//                                                 .button
//                                                 .color,
//                                             onPressed: () {})))
//                               ]))
//                     ])));
//   }
// }
