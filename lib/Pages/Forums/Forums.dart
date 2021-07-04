import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:legal_authority/Pages/Forums/ForumsHome/ForumsHome.dart';
import 'package:legal_authority/Pages/Forums/Profile/ProfilePage/ProfilePage.dart';
import 'package:legal_authority/Pages/Forums/Search/SearchPage.dart';
import 'package:legal_authority/Pages/Forums/ForumsBloc.dart';
import 'package:provider/provider.dart';

class Forums extends StatefulWidget {
  final Function openSidebar;

  const Forums({this.openSidebar});

  @override
  _ForumsState createState() => _ForumsState();
}

class _ForumsState extends State<Forums> {
  PageController _page = PageController();

  int _pageIndex = 0;

  void _changePage(int index) {
    _page.jumpToPage(index);

    setState(() => _pageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final ForumsBloc forumsBloc = Provider.of<ForumsBloc>(context);

    return Scaffold(
        body: SafeArea(
            child: Column(children: [
          Expanded(
              child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _page,
                  onPageChanged: (index) => _changePage(index),
                  children: [
                Home(
                    openSidebar: widget.openSidebar,
                    blogs: forumsBloc.all_blogs,
                    forums: forumsBloc.all_forums),
                SearchPage(forums: forumsBloc.all_forums),
                ProfilePage(forums: forumsBloc.all_forums)
              ]))
        ])),
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
                      label: "search",
                      icon: Icon(FontAwesomeIcons.search, size: 18)),
                  BottomNavigationBarItem(
                      label: "profile", icon: Icon(Icons.person))
                ])));
  }
}
