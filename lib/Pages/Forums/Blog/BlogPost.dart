import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Forums/Blog/BlogPage/BlogPage.dart';
import 'package:legal_authority/Widgets/Dumb/Dash.dart';

class BlogPost extends StatelessWidget {
  String title;
  String forum;
  String description;
  String content;
  String caller;
  bool isLoading = false;

  BlogPost(
      {this.description,
      this.forum,
      this.title,
      this.content,
      this.caller = "feed"});

  BlogPost.loading() {
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    void _goToForum() {
      Navigator.push(
          context,
          MaterialPageRoute<Widget>(
              builder: (context) => BlogPage(
                  title: title, content: content, description: description)));
    }

    bool _inLibrary = false;

    void _saveToLibrary() {}

    void _downvoteComment() {}

    void _upvoteComment() {}

    String _score = "0";

    bool _like = true;

    bool _dislike = false;

    return isLoading
        ? Card(
            elevation: 3,
            margin: EdgeInsets.only(bottom: 20),
            color: Theme.of(context).primaryColor,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Divider(height: 0),
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Dash(width: 50),
                        Container(
                            height: 50,
                            width: 50,
                            color: Theme.of(context).accentColor)
                      ])),
              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Dash(width: 80)),
              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Dash(width: 350),
                        SizedBox(height: 15),
                        Dash(width: 350),
                      ])),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Tooltip(
                      message: "save to library",
                      preferBelow: false,
                      margin: EdgeInsets.only(right: 30),
                      child: InkWell(
                          onTap: _saveToLibrary,
                          child: Container(
                              height: 40,
                              width: 40,
                              child: Icon(
                                  _inLibrary
                                      ? Icons.bookmark_rounded
                                      : Icons.bookmark_border_rounded,
                                  color: Theme.of(context).buttonColor,
                                  size: 16)))),
                  SizedBox(width: 20),
                  Tooltip(
                      message: "share blog post",
                      preferBelow: false,
                      margin: EdgeInsets.only(right: 30),
                      child: InkWell(
                          onTap: _saveToLibrary,
                          child: Container(
                              height: 40,
                              width: 40,
                              child: Icon(Icons.share_rounded,
                                  color: Theme.of(context).buttonColor,
                                  size: 16))))
                ]),
                SizedBox(height: 20),
                Row(children: [
                  IconButton(
                      onPressed: _upvoteComment,
                      icon: Icon(Icons.arrow_upward_rounded,
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
                      icon: Icon(Icons.arrow_downward_rounded,
                          size: 16,
                          color: _dislike == true
                              ? Theme.of(context).buttonColor
                              : Colors.white))
                ])
              ]),
              Divider(height: 0)
            ]))
        : GestureDetector(
            onTap: _goToForum,
            child: Card(
                elevation: 3,
                margin: EdgeInsets.only(bottom: 20),
                color: Theme.of(context).primaryColor,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(height: 0),
                      caller == "feed"
                          ? Row(children: [
                              SizedBox(width: 15),
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Text(forum,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                                height: 1.8,
                                                fontSize: 13,
                                                letterSpacing: 0.8,
                                                color: Colors.grey)),
                                    SizedBox(height: 5),
                                    Text("7h  ago",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                                color: Colors.grey,
                                                fontSize: 13))
                                  ])),
                              Container(
                                  height: 50,
                                  width: 50,
                                  child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                          "lib/Resources/Media/Photos/Background/background7.jpg")))
                            ])
                          : Offstage(),
                      SizedBox(height: 10),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            height: 1.8,
                                            fontSize: 15,
                                            letterSpacing: 0.8,
                                            color:
                                                Theme.of(context).buttonColor)),
                                SizedBox(height: 20),
                                Offstage(
                                    offstage:
                                        description == null || description == ""
                                            ? true
                                            : false,
                                    child: Text(description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(fontSize: 15)))
                              ])),
                      // SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Tooltip(
                                  message: "save to library",
                                  preferBelow: false,
                                  margin: EdgeInsets.only(right: 30),
                                  child: InkWell(
                                      onTap: _saveToLibrary,
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Icon(
                                              _inLibrary
                                                  ? Icons.bookmark_rounded
                                                  : Icons
                                                      .bookmark_border_rounded,
                                              color:
                                                  Theme.of(context).buttonColor,
                                              size: 16)))),
                              SizedBox(width: 20),
                              Tooltip(
                                  message: "share blog post",
                                  preferBelow: false,
                                  margin: EdgeInsets.only(right: 30),
                                  child: InkWell(
                                      onTap: _saveToLibrary,
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Icon(Icons.share_rounded,
                                              color:
                                                  Theme.of(context).buttonColor,
                                              size: 16))))
                            ]),
                            SizedBox(height: 20),
                            Row(children: [
                              IconButton(
                                  onPressed: _upvoteComment,
                                  icon: Icon(Icons.arrow_upward_rounded,
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
                                  icon: Icon(Icons.arrow_downward_rounded,
                                      size: 16,
                                      color: _dislike == true
                                          ? Theme.of(context).buttonColor
                                          : Colors.white))
                            ])
                          ]),
                      Divider(height: 0)
                    ])));
  }
}

//? use timeago package to determine when the post was made..also use in comments
