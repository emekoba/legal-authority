import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:legal_authority/Pages/Lectures/Course/CourseList.dart';
import 'package:legal_authority/Pages/Lectures/Course/CoursePost.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonPost/LessonPost.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/Pages/Lectures/LecturesBloc.dart';

class Lectures extends StatefulWidget {
  final Function openSidebar;

  Lectures({this.openSidebar});

  @override
  _LecturesState createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  PageController _page = PageController();

  int _pageIndex = 0;

  bool _isLoading = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: Random().nextInt(5000)), () {
      setState(() => _isLoading = false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _dismissInput() {
      FocusScopeNode _focus = FocusScope.of(context);

      if (!_focus.hasPrimaryFocus) {
        _focus.unfocus();
      }
    }

    void _openSidebar() async {
      await _dismissInput();

      widget.openSidebar();
    }

    void _changePage(int index) {
      if (!_isLoading) {
        _page.jumpToPage(index);

        setState(() {
          _pageIndex = index;
        });
      }
    }

    return Scaffold(
        body: GestureDetector(
            onTap: _dismissInput,
            child: Column(children: [
              PageHeader(
                  title: "LECTURES",
                  icon: Icons.laptop_mac_rounded,
                  onLeadingIconTapped: _openSidebar),
              _isLoading
                  ? Expanded(
                      child: Center(
                          child: SpinKitFoldingCube(
                              size: 70, color: Theme.of(context).buttonColor)))
                  : Expanded(
                      child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _page,
                          onPageChanged: (index) => _changePage(index),
                          children: [
                          Home(widget.openSidebar),
                          CourseList(widget.openSidebar)
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
                      label: "home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "courses",
                      icon: Icon(FontAwesomeIcons.bookOpen, size: 18))
                ])));
  }
}

class Home extends StatelessWidget {
  final Function openSidebar;

  Home(this.openSidebar);

  @override
  Widget build(BuildContext context) {
    final LecturesBloc lecturesBloc = Provider.of<LecturesBloc>(context);

    return ListView(children: [
      // Padding(
      //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      //     child:
      //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //       Padding(
      //           padding: const EdgeInsets.only(left: 8, bottom: 10),
      //           child: Text("Recent Lessons",
      //               style: Theme.of(context).textTheme.headline6.copyWith(
      //                   fontSize: 20, color: Theme.of(context).accentColor))),
      //       Divider(),
      //     ])),
      Container(
          height: 200,
          child: ListView.builder(
              itemCount: lecturesBloc.recentLessons.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                dynamic key = lecturesBloc.recentLessons.keys.elementAt(index);
                String course =
                    lecturesBloc.recentLessons[key]["course"].toString();

                return LessonPost.recent(
                    course: course, lesson: key.toString());
              })),

      //?................

      // Padding(
      //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      //     child:
      //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //       Padding(
      //           padding: const EdgeInsets.only(left: 8, bottom: 10),
      //           child: Text("Recent Test",
      //               style: Theme.of(context).textTheme.headline6.copyWith(
      //                   fontSize: 20, color: Theme.of(context).accentColor))),
      //       Divider()
      //     ])),
      Container(
          height: 250,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LessonPost.preview(
              course: "International",
              lesson: "The nature an development of international law",
              img: AssetImage(
                  'lib/Resources/Media/Photos/Background/background6.jpg'))),
      SizedBox(height: 50),
      // Padding(
      //     padding: const EdgeInsets.all(20),
      //     child:
      //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //       Padding(
      //           padding: const EdgeInsets.only(left: 8, bottom: 10),
      //           child: Text("Recent Courses",
      //               style: Theme.of(context).textTheme.headline6.copyWith(
      //                   fontSize: 20, color: Theme.of(context).accentColor))),
      //       Divider(),
      //     ])),
      GridView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: lecturesBloc.recentLessons.length,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20),
          itemBuilder: (BuildContext context, int index) {
            dynamic key = lecturesBloc.recentLessons.keys.elementAt(index);

            String course =
                lecturesBloc.recentLessons[key]["course"].toString();

            return CoursePost(course: course);
          })
    ]);
  }
}
