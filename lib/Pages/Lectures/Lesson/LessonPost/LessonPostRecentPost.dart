import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Lectures/LecturesBloc.dart';
import 'package:provider/provider.dart';

class LessonPostRecentPost extends StatelessWidget {
  final String lesson;
  final String course;
  final Function saveToLibrary;
  final Function openLessonPage;

  const LessonPostRecentPost.lesson(
      {this.lesson, this.course, this.saveToLibrary, this.openLessonPage});

  const LessonPostRecentPost.test(
      {this.lesson, this.course, this.saveToLibrary, this.openLessonPage});

  @override
  Widget build(BuildContext context) {
    final LecturesBloc lecturesBloc = Provider.of<LecturesBloc>(context);

    bool _inLibrary = lecturesBloc.courses[course]["lessons"][lesson]
        ["isSavedToLibrary"] as bool;

    return GestureDetector(
        onTap: () => openLessonPage(),
        child: Column(children: [
          Container(
              height: 150,
              width: 200,
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  // color: Theme.of(context).accentColor,
                  color: Color(0xfff6f5f1),
                  borderRadius: BorderRadius.circular(12)),
              child: Stack(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Text(lesson,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor))),
                  ),
                  Container(
                      constraints: BoxConstraints(minHeight: 20),
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(course,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 15,
                              color: Theme.of(context).primaryColor)))
                ]),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Theme.of(context).buttonColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(10))),
                        child: IconButton(
                            icon: Icon(
                                _inLibrary
                                    ? Icons.bookmark_rounded
                                    : Icons.bookmark_border_rounded,
                                color: Theme.of(context).iconTheme.color),
                            iconSize: 16,
                            onPressed: () => saveToLibrary())))
              ])),
          SizedBox(width: 30),
        ]));
  }
}

//todo: recentpost.test will have the number of tests...

//todo: recentpost.lesson will have number of topics..get index of that topic
//todo: then use it as the number eg.recency is 1/number of lessons in evidence,
//todo: sources is 3/3 in international law etc..
