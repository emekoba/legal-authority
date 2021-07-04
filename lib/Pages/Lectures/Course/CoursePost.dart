import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonList/LessonList.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/Pages/Lectures/LecturesBloc.dart';

class CoursePost extends StatelessWidget {
  final String course;
  final Map lessons;
  bool isRecent = false;

  CoursePost({this.course, this.lessons});

  CoursePost.recent({this.course, this.lessons}) {
    isRecent = true;
  }

  @override
  Widget build(BuildContext context) {
    final LecturesBloc lecturesBloc = Provider.of<LecturesBloc>(context);

    bool _inLibrary = lecturesBloc.courses[course]["isSavedToLibrary"] as bool;

    TextSpan _wordText = TextSpan(
        text: course,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(color: Colors.amberAccent, fontSize: 15));

    TextStyle _richTextStyle =
        Theme.of(context).textTheme.headline6.copyWith(fontSize: 11);

    void _openLessonList() {
      Navigator.push(
          context,
          MaterialPageRoute<Widget>(
              builder: (context) =>
                  LessonList(course: course, lessons: lessons)));
    }

    void _saveToLibrary() {
      lecturesBloc.toggleSaveCourse(
          course: course, currentSaveStateOfItem: _inLibrary);

      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).accentColor,
          content: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: _inLibrary ? "removed   " : "saved   ",
                style: TextStyle(color: Colors.white)),
            _wordText,
            TextSpan(
                text: _inLibrary
                    ? "   course from library"
                    : "   course to library",
                style: TextStyle(color: Colors.white))
          ], style: _richTextStyle)),
          action: SnackBarAction(
              label: "undo", textColor: Colors.red, onPressed: () {})));
    }

    return GestureDetector(
        onTap: _openLessonList,
        child: isRecent
            ? Container(
                decoration: BoxDecoration(
                    color: Color(0xfff6f5f1),
                    // Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(16)),
              )
            : Container(
                decoration: BoxDecoration(
                    color: Color(0xfff6f5f1),
                    borderRadius: BorderRadius.circular(16)),
                child: Stack(children: [
                  Container(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topLeft: Radius.circular(14))),
                                margin: const EdgeInsets.all(0),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Text(course,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                    fontSize: 13,
                                                    letterSpacing: 1.5,
                                                    height: 1.8)))))),
                        Expanded(flex: 3, child: Container())
                      ])),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
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
                              onPressed: _saveToLibrary)))
                ])));
  }
}
