// import 'package:flutter/material.dart';
// import 'package:legal_authority/Pages/Forums/Blog/BlogPage.dart';
// import 'package:legal_authority/Pages/Forums/Blog/BlogPost.dart';
// import 'package:legal_authority/Pages/Forums/Forum/ForumPage.dart';
// import 'package:legal_authority/Resources/Resources.dart';

// class ForumFeed extends StatefulWidget {
//   @override
//   _ForumFeedState createState() => _ForumFeedState();
// }

// class _ForumFeedState extends State<ForumFeed> {
//   List<String> forumsList = [];

//   void _openBlog() {
//     Navigator.push(
//         context,
//         MaterialPageRoute<Widget>(
//             builder: (context) =>
//                 BlogPage(title: "11 steps to how laws are made in Nigeria")));
//   }

//   void _openForum(String name) {
//     Navigator.push(context,
//         MaterialPageRoute<Widget>(builder: (context) => ForumPage(name: name)));
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   void bruh() {
//     String forum;
//     String description;
//     bool isSavedToLibrary = false;
//     Map<String, String> created = {"by": "", "date": ""};
//     List<String> moderators = [];
//     List<String> members = [];
//     Map<String, Map> blogs = {};

//     // forums.forEach((String key, Map<String, dynamic> val) {
//     //   forum = key;
//     //   description = val["description"];
//     //   isSavedToLibrary = val["isSavedToLibrary"];
//     //   created["by"] = val["created"]["by"];
//     //   created["date"] = val["created"]["date"];
//     //   moderators = val["moderators"];
//     //   members = val["members"];
//     //   // blogs = val["blogs"];

//     //   val["blogs"].forEach((String key, Map val) {
//     //     blogs = {key: val};

//     //     print(blogs);
//     //   });
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: 3,
//         itemBuilder: (context, index) =>
//             BlogPost(index: index, openBlog: _openBlog, openForum: _openForum));
//   }
// }
