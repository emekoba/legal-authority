import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Dumb/Flag.dart';
import 'package:legal_authority/Widgets/Network/Firebase.dart';
import 'package:legal_authority/Widgets/GlobalFunctions.dart';

class Comment extends StatefulWidget {
  final String comment;
  final String username;
  final String occupation;
  final String institution;
  final String level;
  final String country;
  final CollectionReference commentCollection;

  const Comment(
      {this.comment,
      this.username,
      this.commentCollection,
      this.occupation,
      this.institution,
      this.level,
      this.country});

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  void _expandComment() {}

  @override
  Widget build(BuildContext context) {
    TextStyle _divider = TextStyle(color: Theme.of(context).buttonColor);

    void _downvoteComment() {}

    void _upvoteComment() {}

    return Card(
        margin: EdgeInsets.only(bottom: 10),
        color: Theme.of(context).primaryColor,
        child: Container(
            child: Column(children: [
          Divider(height: 0),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          width: 3, color: Theme.of(context).buttonColor))),
              constraints: BoxConstraints(minHeight: 100),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                Flag(
                                    country: widget.country ?? "Nigeria",
                                    showLabel: false,
                                    height: 15,
                                    width: 20),
                                SizedBox(width: 10),
                                Text("|", style: _divider),
                                SizedBox(width: 10),
                                Text(widget.username ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(fontSize: 13)),
                                SizedBox(width: 10),
                                Text("|", style: _divider),
                                SizedBox(width: 10),
                                Text(widget.occupation ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(fontSize: 13)),
                                SizedBox(width: 10),
                                Text("|", style: _divider),
                                SizedBox(width: 10),
                                Text(widget.level ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(fontSize: 13)),
                                SizedBox(width: 10),
                                Text("|", style: _divider),
                                SizedBox(width: 10),
                                // Flag(
                                //     country: widget.country ?? "Nigeria",
                                //     showLabel: false,
                                //     height: 15,
                                //     width: 20),
                                // SizedBox(width: 10),
                                // Text("|", style: _divider),
                                // SizedBox(width: 10),
                              ])),
                          SizedBox(width: 10),
                          FittedBox(
                              child: CircleAvatar(
                                  minRadius: 13,
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: AssetImage(
                                      "lib/Resources/Profile/Profile2.jpg"))),
                        ]),
                    Text(widget.institution ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontSize: 13)),
                    SizedBox(height: 25),
                    Text(widget.comment,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 15)),
                    SizedBox(height: 10),
                    Row(children: [
                      Text("7h  ago",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontSize: 13)),
                      SizedBox(width: 20),
                      Expanded(
                          child: Row(children: [
                        InkWell(
                            onTap: _expandComment,
                            child: Text("Replies",
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: Theme.of(context).buttonColor,
                                        fontSize: 12)))
                      ])),
                      StreamBuilder<dynamic>(
                          stream: widget.commentCollection
                              .doc(widget.comment)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Offstage();
                            }

                            DocumentSnapshot _comments_docs =
                                snapshot.data as DocumentSnapshot;

                            bool _like = _comments_docs["likes"]
                                .contains(fire_user) as bool;

                            bool _dislike = _comments_docs["dislikes"]
                                .contains(fire_user) as bool;

                            String _score = concatenateLargeNumber(
                                _comments_docs["score"] as int);

                            return Row(children: [
                              IconButton(
                                  onPressed: _upvoteComment,
                                  icon: Icon(Icons.thumb_up_rounded,
                                      size: 16,
                                      color: _like == true
                                          ? Theme.of(context).buttonColor
                                          : Colors.white)),
                              Text(_score ?? "",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(fontSize: 12)),
                              IconButton(
                                  onPressed: _downvoteComment,
                                  icon: Icon(Icons.thumb_down_rounded,
                                      size: 16,
                                      color: _dislike == true
                                          ? Theme.of(context).buttonColor
                                          : Colors.white))
                            ]);
                          })
                    ])
                  ])),
          Divider(height: 0)
        ])));
  }
}
