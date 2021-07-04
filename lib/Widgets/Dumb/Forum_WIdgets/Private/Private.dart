// import 'package:flutter/material.dart';
// import 'package:legal_authority/Pages/Forums/Private/Replies.dart';

// class Private extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         child: Column(children: [
//       ExpansionTile(
//           // initiallyExpanded: true,
//           tilePadding: const EdgeInsets.symmetric(horizontal: 20),
//           childrenPadding: const EdgeInsets.only(bottom: 20),
//           title: Row(children: [
//             Text("REPLIES",
//                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//             SizedBox(width: 15),
//             Icon(Icons.mark_chat_read_rounded,
//                 size: 15, color: Theme.of(context).buttonColor)
//           ]),
//           children: List.generate(5, (index) => Replies())),
//       ExpansionTile(
//           initiallyExpanded: true,
//           tilePadding: const EdgeInsets.symmetric(horizontal: 20),
//           childrenPadding: const EdgeInsets.only(top: 20),
//           title: Row(children: [
//             Text("FORUMS",
//                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//             SizedBox(width: 15),
//             Icon(Icons.web, size: 15, color: Theme.of(context).buttonColor)
//           ]),
//           children: [
//             InkWell(
//                 onTap: () {},
//                 child: Container(
//                     width: double.infinity,
//                     height: 50,
//                     child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text("CREATED",
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold)),
//                               SizedBox(width: 15),
//                               Icon(Icons.create_new_folder,
//                                   size: 15,
//                                   color: Theme.of(context).buttonColor)
//                             ])))),
//             Divider(height: 25),
//             Container(height: 50),
//             InkWell(
//                 onTap: () {},
//                 child: Container(
//                     width: double.infinity,
//                     height: 50,
//                     child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text("subscribed",
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold)),
//                               SizedBox(width: 15),
//                               Icon(Icons.add,
//                                   size: 15,
//                                   color: Theme.of(context).buttonColor)
//                             ])))),
//             Divider(height: 25),
//             Container(height: 200)
//           ]),
//       InkWell(
//           onTap: () {},
//           child: Container(
//               width: double.infinity,
//               height: 50,
//               child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(children: [
//                     Text("BLOGS",
//                         style: TextStyle(
//                             fontSize: 12, fontWeight: FontWeight.bold)),
//                     SizedBox(width: 15),
//                     Icon(Icons.text_snippet_rounded,
//                         size: 15, color: Theme.of(context).buttonColor)
//                   ])))),
//       // Divider(height: 25),
//       Container(height: 300)
//     ]));
//   }
// }
