import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:legal_authority/Pages/Forums/Forum/ForumPage/ForumPage.dart';
import 'package:legal_authority/Pages/Forums/ForumsBloc.dart';
import 'package:legal_authority/Widgets/Style/AvatarList.dart';
import 'package:provider/provider.dart';

class ForumPost extends StatelessWidget {
  final String title;
  final String user;
  final int subscribers;
  final int moderators;
  final int blogs;
  final DocumentReference docRef;
  final double height;
  final double width;
  final bool isSubscribed;

  String type;

  ForumPost(
      {this.title,
      this.user,
      this.subscribers,
      this.blogs,
      this.moderators,
      this.docRef,
      this.height,
      this.width,
      this.isSubscribed});

  ForumPost.full(
      {this.title,
      this.user,
      this.subscribers,
      this.blogs,
      this.moderators,
      this.docRef,
      this.height,
      this.width,
      this.isSubscribed}) {
    type = "full";
  }

  double _getPadding() {
    double x = 0;

    switch (type) {
      case "full":
        x = 12;
        break;

      default:
        x = 10;
    }

    return x;
  }

  double _getTopBoxRadius() {
    double x = 0;

    switch (type) {
      case "full":
        x = 10;
        break;

      default:
        x = 8;
    }

    return x;
  }

  double _getBottomBoxRadius() {
    double x = 0;

    switch (type) {
      case "full":
        x = 10;
        break;

      default:
        x = 8;
    }

    return x;
  }

  double _getFontSize() {
    double x = 0;

    switch (type) {
      case "full":
        x = 15;
        break;

      default:
        x = 12;
    }

    return x;
  }

  double _getIconSize() {
    double x = 0;

    switch (type) {
      case "full":
        x = 20;
        break;

      default:
        x = 17;
    }

    return x;
  }

  double _getSizedBox() {
    double x = 0;

    switch (type) {
      case "full":
        x = 19;
        break;

      default:
        x = 10;
    }

    return x;
  }

  double _getNumTextSize() {
    double x = 0;

    switch (type) {
      case "full":
        x = 15;
        break;

      default:
        x = 11;
    }

    return x;
  }

  double _getAvatarSize() {
    double x = 0;

    switch (type) {
      case "full":
        x = 10;
        break;

      default:
        x = 9;
    }

    return x;
  }

  EdgeInsetsGeometry _getBottomPadding() {
    EdgeInsetsGeometry x;

    switch (type) {
      case "full":
        x = EdgeInsets.fromLTRB(12, 0, 12, 12);
        break;

      default:
        x = EdgeInsets.fromLTRB(10, 0, 10, 10);
    }

    return x;
  }

  @override
  Widget build(BuildContext context) {
    final ForumsBloc forumsBloc = Provider.of<ForumsBloc>(context);

    final TextSpan _wordText = TextSpan(
        text: title,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(color: Colors.amberAccent, fontSize: 15));

    final TextStyle _richTextStyle =
        Theme.of(context).textTheme.headline6.copyWith(fontSize: 11);

    void _toggleSubscribe() async {
      forumsBloc.toggleSubscribeToForum(
          forum: title, currenSubscribedStateOfForum: isSubscribed);

      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).accentColor,
          content: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: isSubscribed ? "unSubscribed from  " : "Subscribed to ",
                style: TextStyle(color: Colors.white)),
            _wordText,
            TextSpan(text: "  Forum", style: TextStyle(color: Colors.white))
          ], style: _richTextStyle)),
          action: SnackBarAction(
              label: "undo", textColor: Colors.red, onPressed: () {})));
    }

    void _openForumPage() {
      Navigator.push(
          context,
          MaterialPageRoute<Widget>(
              builder: (context) =>
                  ForumPage(doc: docRef, user: user, forumName: title)));
    }

    void _postOptions() {
      showModalBottomSheet<Widget>(
          backgroundColor: Theme.of(context).primaryColor,
          context: context,
          builder: (context) {
            return PostOptions();
          });
    }

    return GestureDetector(
        onTap: _openForumPage,
        onLongPress: _postOptions,
        child: Container(
          height: height,
          width: width,
          child: Column(children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(_getTopBoxRadius())),
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(_getPadding()),
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: _getFontSize()))),
            Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(_getBottomBoxRadius())),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                                alignment: Alignment.topRight,
                                child: Tooltip(
                                    message: isSubscribed
                                        ? "unsubscribe"
                                        : "subscribe",
                                    preferBelow: false,
                                    margin: EdgeInsets.only(right: 30),
                                    child: GestureDetector(
                                        onTap: _toggleSubscribe,
                                        child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                border: Border.all(
                                                    color: Theme.of(context)
                                                        .accentColor),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                        _getBottomBoxRadius()),
                                                    topRight: Radius.circular(
                                                        _getBottomBoxRadius()))),
                                            child: Icon(
                                                isSubscribed
                                                    ? Icons.check_rounded
                                                    : Icons.add_box,
                                                // Icons
                                                //     .check_box_outline_blank,
                                                // color: Theme.of(context).buttonColor,
                                                color: Colors.white,
                                                size: 16)))))),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(_getPadding()),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.text_snippet_rounded,
                                            size: _getIconSize(),
                                            color:
                                                Theme.of(context).accentColor),
                                        Text(blogs.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(
                                                    fontSize: _getNumTextSize(),
                                                    color: Theme.of(context)
                                                        .accentColor))
                                      ]),
                                  SizedBox(height: _getSizedBox()),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AvatarList(
                                            size: _getAvatarSize(),
                                            number: 3,
                                            borderColor: Colors.white,
                                            borderWidth: 1),
                                        Text(subscribers.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(
                                                    fontSize: _getNumTextSize(),
                                                    color: Theme.of(context)
                                                        .accentColor))
                                      ])
                                ]),
                          ),
                        ),
                      ],
                    )))
          ]),
        ));
  }
}

class PostOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          Text("Delete Forum",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 20, color: Theme.of(context).accentColor)),
        ]));
  }
}
