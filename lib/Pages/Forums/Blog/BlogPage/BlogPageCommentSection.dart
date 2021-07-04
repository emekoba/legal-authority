import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Forums/Blog/Comment.dart';

class BlogPageCommentSection extends StatefulWidget {
  final CollectionReference usersCollection;
  final DocumentReference blogsCollection;

  const BlogPageCommentSection({this.usersCollection, this.blogsCollection});

  @override
  _BlogPageCommentSectionState createState() => _BlogPageCommentSectionState();
}

class _BlogPageCommentSectionState extends State<BlogPageCommentSection> {
  bool _commentSectionIsOpen = false;

  void _toggleCommentSection() {
    setState(() => _commentSectionIsOpen = !_commentSectionIsOpen);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: widget.blogsCollection.collection("comments").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Icon(
                                  _commentSectionIsOpen
                                      ? Icons.arrow_circle_up_rounded
                                      : Icons.arrow_circle_down_rounded,
                                  color: Theme.of(context).accentColor,
                                  size: 18)),
                          SizedBox(width: 10),
                          Text("Comments",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      fontSize: 18,
                                      color: Theme.of(context).accentColor))
                        ])));
          }

          QuerySnapshot _comments = snapshot.data as QuerySnapshot;

          return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            if (index == 0) {
              return InkWell(
                  onTap: _toggleCommentSection,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Icon(
                                    _commentSectionIsOpen
                                        ? Icons.arrow_circle_up_rounded
                                        : Icons.arrow_circle_down_rounded,
                                    color: Theme.of(context).buttonColor,
                                    size: 18)),
                            SizedBox(width: 10),
                            Text("Comments",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontSize: 18,
                                        color: Theme.of(context).buttonColor)),
                          ])));
            }

            index -= 1;

            if (_commentSectionIsOpen) {
              return StreamBuilder<dynamic>(
                  stream: widget.usersCollection
                      .doc(_comments.docs[index]["commenter"] as String)
                      .snapshots(),
                  builder: (context, usersnapshot) {
                    if (!usersnapshot.hasData) {
                      return Offstage();
                    }

                    DocumentSnapshot _users_docs =
                        usersnapshot.data as DocumentSnapshot;

                    return Comment(
                        commentCollection:
                            widget.blogsCollection.collection("comments"),
                        comment: _comments.docs[index].id,
                        username: _users_docs["username"] as String,
                        occupation: _users_docs["occupation"] as String,
                        institution: _users_docs["institutionName"] as String,
                        country: _users_docs["country"] as String,
                        level: _users_docs["levelInInstitution"] as String);
                  });
            } else {
              return Offstage();
            }
          }, childCount: _comments.docs.length));
        });
  }
}
