import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:legal_authority/Pages/Forums/Blog/BlogList.dart';
import 'package:legal_authority/Pages/Forums/Profile/ProfileList.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
import 'package:legal_authority/Widgets/Network/Firebase.dart';
import 'package:legal_authority/Widgets/Style/AvatarList.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/Pages/Forums/ForumsBloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ForumPage extends StatefulWidget {
  final String forumName;
  final String user;
  final DocumentReference doc;

  const ForumPage({this.forumName, this.user, this.doc});

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  PageController _page = PageController();

  int _pageIndex = 0;

  bool _fabShown = true;

  bool _subscribed = false;

  void _changePage(int index) {
    _page.jumpToPage(index);

    setState(() => _pageIndex = index);

    _toggleFabShown();
  }

  void _toggleFabShown() {
    setState(() {
      if (_pageIndex == 0) {
        _fabShown = true;
      } else if (_pageIndex == 1 || _pageIndex == 2) {
        _fabShown = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ForumsBloc forumsBloc = Provider.of<ForumsBloc>(context);

    void _toggleSubscribe() async {
      forumsBloc.toggleSubscribeToForum(
          forum: widget.forumName, currenSubscribedStateOfForum: _subscribed);
    }

    return StreamBuilder<dynamic>(
        stream: widget.doc.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
                body: Center(
                    child: SpinKitFoldingCube(
                        size: 70, color: Theme.of(context).buttonColor)));
          }

          DocumentSnapshot _forums_docs = snapshot.data as DocumentSnapshot;

          _subscribed = _forums_docs["subscribers"].contains(fire_user) as bool;

          return Scaffold(
              floatingActionButton: _fabShown
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: FloatingActionButton.extended(
                          onPressed: _toggleSubscribe,
                          backgroundColor: _subscribed
                              ? Theme.of(context).buttonColor
                              : Theme.of(context).accentColor,
                          label: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(_subscribed ? "Subscribed" : "Subscribe",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            // letterSpacing: 1.5,
                                            color: _subscribed
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .buttonColor)),
                                _subscribed
                                    ? Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 4),
                                        child: Icon(FontAwesomeIcons.userCheck,
                                            size: 13,
                                            color:
                                                Theme.of(context).primaryColor))
                                    : Offstage()
                              ])))
                  : Offstage(),
              body: SafeArea(
                  child: PageView(
                      controller: _page,
                      onPageChanged: (index) => _changePage(index),
                      children: [
                    Home(
                      forumName: widget.forumName,
                      description: _forums_docs["description"] as String,
                      subscribers: _forums_docs["subscribers"].length as int,
                      moderators: _forums_docs["moderators"].length as int,
                      blogs: _forums_docs["blogs"].length as int,
                    ),
                    BlogList(
                      forumName: widget.forumName,
                      user: widget.user,
                      blogs: forumsBloc.all_blogs,
                    ),
                    ProfileList(forum: widget.forumName, user: widget.user)
                  ])),
              bottomNavigationBar: Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: Theme.of(context).primaryColor),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                      child: BottomNavigationBar(
                          currentIndex: _pageIndex,
                          onTap: (index) => _changePage(index),
                          items: [
                            BottomNavigationBarItem(
                                title: Text("forum",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            fontSize: 18,
                                            color: _pageIndex == 0
                                                ? Theme.of(context).buttonColor
                                                : Theme.of(context)
                                                    .accentColor)),
                                icon: Offstage()),
                            BottomNavigationBarItem(
                                title: Text("blogs",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            fontSize: 18,
                                            color: _pageIndex == 1
                                                ? Theme.of(context).buttonColor
                                                : Theme.of(context)
                                                    .accentColor)),
                                icon: Offstage()),
                            BottomNavigationBarItem(
                                title: Text("subscribers",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            fontSize: 18,
                                            color: _pageIndex == 2
                                                ? Theme.of(context).buttonColor
                                                : Theme.of(context)
                                                    .accentColor)),
                                icon: Offstage())
                          ]))));
        });
  }
}

class Home extends StatelessWidget {
  final String forumName;
  final int subscribers;
  final int blogs;
  final int moderators;
  final String description;

  const Home(
      {this.forumName,
      this.subscribers,
      this.blogs,
      this.moderators,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(children: [
        Container(
            height: 300,
            width: double.infinity,
            child: Image.asset(
                "lib/Resources/Media/Photos/Background/background1.jpg",
                fit: BoxFit.cover)),
        PageHeader(
            title: forumName,
            titleStyle: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: 14, color: Colors.black),
            titleBox: true,
            icon: Icons.arrow_back,
            onLeadingIconTapped: () => Navigator.pop(context))
      ]),
      Offstage(
          offstage: description == null || description == "",
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(description ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 15)))),
      ForumInfo(title: "Subscribers", number: subscribers),
      ForumInfo(title: "Moderators", number: moderators),
      ForumInfo(title: "Blogs", number: blogs),
    ]);
  }
}

class ForumInfo extends StatelessWidget {
  final String title;
  final int number;

  const ForumInfo({this.title, this.number});

  IconData _getIcon() {
    switch (title) {
      case "Subscribers":
        return Icons.supervised_user_circle_rounded;
        break;

      case "Moderators":
        return Icons.gavel_rounded;
        break;

      case "Blogs":
        return Icons.text_snippet_rounded;
        break;
    }

    return null;
  }

  Widget _getAvatars() {
    switch (title) {
      case "Subscribers":
        return AvatarList(
            size: 13, spacingSecond: 18, spacingThird: 35, number: 3);
        break;

      case "Moderators":
        return AvatarList(
            size: 13, spacingSecond: 18, spacingThird: 35, number: 2);
        break;

      case "Blogs":
        return Offstage();
        break;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Icon(_getIcon(), color: Theme.of(context).buttonColor),
            SizedBox(width: 20),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 13, fontWeight: FontWeight.bold)),
            SizedBox(width: 20),
            Text(number.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 15, fontWeight: FontWeight.bold))
          ]),
          _getAvatars()
        ]));
  }
}
