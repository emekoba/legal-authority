import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonPost/LessonPost.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/mainBloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Snippets extends StatefulWidget {
  @override
  _SnippetsState createState() => _SnippetsState();
}

class _SnippetsState extends State<Snippets> {
  PageController _page = PageController();

  int _pageIndex = 0;

  bool _pageEntered = false;

  Map _bruh = <String, dynamic>{"bruhhh": false};

  bool _inLibrary = true;

  void _saveToLibrary() {}

  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      // _restartTimer();
      // _scoreTest(question, answer);

      // timer.cancel();
    });

    Future.delayed(Duration.zero, () {
      // _skippedColor = Theme.of(context).buttonColor;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = Provider.of<MainBloc>(context);

    () {
      if (!_pageEntered) {
        mainBloc.onPageEntered(pageName: "laws and docs");

        setState(() {
          _pageEntered = true;
        });
      }
    }();

    _expandCategory(String category) {
      Navigator.push(
          context, MaterialPageRoute<Widget>(builder: (context) => null));

      showModalBottomSheet<Widget>(
        context: context,
        builder: (ctx) {
          return Container();
        },
        // enableDrag: false,
        // isScrollControlled: true,
      );
    }

    void _changePage(int index) {
      _page.jumpToPage(index);

      setState(() {
        _pageIndex = index;
      });
    }

// void _init_forums() async {
//   QuerySnapshot snapshot = await forumsCollection
//       .where("createdBy", isEqualTo: fire_user)
//       .get();

//   snapshot.docs.forEach((DocumentSnapshot doc) {
//     _created_forums[doc.id] = doc.data();
//   });
// }

//  Firestore.instance
//     .collection('books').snapshots().listen((querySnapshot){

// });

    return Scaffold(
      floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 10, bottom: 20),
          child: FloatingActionButton(
              backgroundColor: Theme.of(context).buttonColor,
              child: Icon(Icons.add, color: Theme.of(context).iconTheme.color),
              onPressed: () {})),
      body: Column(children: [
        //? subheader snippet...
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 10),
                  child: Text("Recent Tests",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 20, color: Theme.of(context).accentColor))),
              Divider(),
            ])),

        //? Text snippet...
        Text("",
            style:
                Theme.of(context).textTheme.headline6.copyWith(fontSize: 15)),

        GridView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: _bruh.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10, crossAxisSpacing: 10, mainAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              dynamic key = _bruh.keys.elementAt(index);
            }),

        ListView.builder(
            itemCount: _bruh.length,
            itemBuilder: (context, index) {
              dynamic key = _bruh.keys.elementAt(index);
            }),

        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: IconButton(
                icon: Icon(
                    _inLibrary
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    color: Theme.of(context).iconTheme.color),
                iconSize: 16,
                onPressed: _saveToLibrary)),

        Expanded(
            child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _page,
                onPageChanged: (index) => _changePage(index),
                children: [])),
        Expanded(
            child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                // controller: _pageTab,
                itemBuilder: (ctxt, pos) {
                  // return _tabs[pos];
                },
                itemCount: 3)),
        Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "lib/Resources/Media/Photos/Background/background8.jpg")),
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(10))),

        // DropdownButton<dynamic>(
        //                   value: 1,
        //                   onChanged: (dynamic value) {},
        //                   items: _occupations
        //                       .map<DropdownMenuItem>((dynamic e) {
        //                     setState(() {
        //                       _index++;
        //                     });

        //                     return DropdownMenuItem<dynamic>(
        //                         value: _index,
        //                         child: Text(_index.toString()));
        //                   }).toList())),
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
                    label: "feed", icon: Icon(Icons.home_rounded)),
                BottomNavigationBarItem(
                    label: "search",
                    icon: Icon(FontAwesomeIcons.search, size: 18)),
                BottomNavigationBarItem(
                    label: "profile", icon: Icon(Icons.person))
              ])),
    );
  }
}
