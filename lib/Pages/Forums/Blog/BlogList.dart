import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Forums/Blog/BlogPost.dart';

class BlogList extends StatelessWidget {
  final String user;
  final String forumName;
  final CollectionReference blogs;

  BlogList({this.user, this.blogs, this.forumName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<dynamic>(
            stream:
                blogs.where("createdInForum", isEqualTo: forumName).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Offstage();
              }

              return Container(
                  padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: ListView.builder(
                      itemCount: snapshot.data.documents.length as int,
                      itemBuilder: (context, index) {
                        DocumentSnapshot _blogs_docs =
                            snapshot.data.documents[index] as DocumentSnapshot;

                        return BlogPost(
                            caller: "forum",
                            forum: forumName,
                            content: _blogs_docs["content"] as String,
                            title: _blogs_docs.id,
                            description: _blogs_docs["description"] as String);
                      }));
            }));
  }
}
