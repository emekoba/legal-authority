import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:legal_authority/Pages/Library/LibraryOfLawsAndDocs.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';

class Library extends StatefulWidget {
  final Function openSidebar;

  Library({this.openSidebar});

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  PageController _page = PageController();

  int _pageIndex = 0;

  List<Widget> _pages = [
    LibraryOfLawsAndDocs(),
    Center(child: Text("dictionary")),
    Center(child: Text("lectures")),
    Center(child: Text("forums")),
    Center(child: Text("ask an expert")),
  ];

  void _changePage(int index) {
    _page.jumpToPage(index);

    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          PageHeader(
              title: "LIBRARY",
              icon: Icons.bookmark_rounded,
              onLeadingIconTapped: widget.openSidebar),
          Expanded(
              child: PageView.builder(
                  onPageChanged: (index) => _changePage(index),
                  controller: _page,
                  itemBuilder: (BuildContext context, int pos) => _pages[pos]))
        ]),
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
                      label: "laws and docs", icon: Icon(Icons.gavel_rounded)),
                  BottomNavigationBarItem(
                      label: "dictionary",
                      icon: Icon(FontAwesomeIcons.book, size: 19)),
                  BottomNavigationBarItem(
                      label: "lectures", icon: Icon(Icons.laptop_mac_rounded)),
                  BottomNavigationBarItem(
                      label: "forums", icon: Icon(Icons.web)),
                  BottomNavigationBarItem(
                      label: "ask an expert", icon: Icon(Icons.face_rounded))
                ])));
  }
}

//? create a new bloc that does the whole mapping through aotf and all it does is
//? it just provides the widgets or at least the map _tabs so all aotf has to do
//? is to just generate widgets and the value isSavedToLibrary is set to true inside
//? the _tabs map so that the state is truly persistent...

//? presave stuff like the 1999 const, evidence act, land use act etc..just
//? check out the curriculum of workstation to decide...
