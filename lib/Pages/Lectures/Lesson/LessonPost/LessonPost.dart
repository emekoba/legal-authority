import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonPage.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonPost/LessonPostPreview.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonPost/LessonPostRecentPost.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonPost/LessonPostVideoPost.dart';
import 'package:legal_authority/Widgets/Dumb/ErrorPage.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/Pages/Lectures/LecturesBloc.dart';

class LessonPost extends StatelessWidget {
  final String course;
  final String lesson;
  String description;
  AssetImage img;
  String form;

  LessonPost.papers({this.course, this.lesson, this.img, this.description}) {
    form = "papers";
  }

  LessonPost.video({this.course, this.lesson, this.img, this.description}) {
    form = "video";
  }

  LessonPost.audio({this.course, this.lesson, this.img, this.description}) {
    form = "audio";
  }

  LessonPost.preview({this.course, this.lesson, this.img}) {
    form = "preview";
  }

  LessonPost.recent({this.course, this.lesson}) {
    form = "recent";
  }

  @override
  Widget build(BuildContext context) {
    final LecturesBloc lecturesBloc = Provider.of<LecturesBloc>(context);

    TextSpan _wordText = TextSpan(
        text: lesson,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(color: Colors.amberAccent, fontSize: 15));

    TextStyle _richTextStyle =
        Theme.of(context).textTheme.headline6.copyWith(fontSize: 11);

    bool _inLibrary = form == "video"
        ? true
        : lecturesBloc.courses[course]["lessons"][lesson]["isSavedToLibrary"]
            as bool;

    void _openLessonPage() {
      Navigator.push(context,
          MaterialPageRoute<Widget>(builder: (BuildContext context) {
        switch (form) {
          case "papers":
            return LessonPage.papers(course: course, lesson: lesson);
            break;

          case "video":
            return LessonPage.video(course: course, lesson: lesson);
            break;

          case "audio":
            return LessonPage.audio(course: course, lesson: lesson);
            break;

          default:
            return ErrorPage(
                message: "switch failed. check out lessonpost.dart ");
        }
      }));
    }

    void _saveToLibrary() {
      lecturesBloc.toggleSaveLesson(
          course: course, lesson: lesson, currentSaveStateOfItem: _inLibrary);

      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).accentColor,
          content: RichText(
              text: TextSpan(children: [
            TextSpan(
                text:
                    _inLibrary ? "removed lesson on   " : "saved lesson on   ",
                style: TextStyle(color: Colors.white)),
            _wordText,
            TextSpan(
                text: _inLibrary ? "   from library" : "   to library",
                style: TextStyle(color: Colors.white))
          ], style: _richTextStyle)),
          action: SnackBarAction(
              label: "undo", textColor: Colors.red, onPressed: () {})));
    }

    Widget _getPost() {
      switch (form) {
        case "video":
          return LessonPostVideoPost(course: course, lesson: lesson);
          break;

        case "preview":
          return LessonPostPreview(
              course: course,
              lesson: lesson,
              img: img,
              openLessonPage: _openLessonPage,
              saveToLibrary: _saveToLibrary);
          break;

        case "recent":
          return LessonPostRecentPost.lesson(
              course: course,
              lesson: lesson,
              openLessonPage: _openLessonPage,
              saveToLibrary: _saveToLibrary);
          break;

        default:
          return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 5, color: Theme.of(context).buttonColor))),
              child: InkWell(
                  onTap: _openLessonPage,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(height: 0),
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            constraints: BoxConstraints(minHeight: 80),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(lesson,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(fontSize: 17)),
                                  SizedBox(height: 10),
                                  Text(description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(fontSize: 13, height: 1.4))
                                ])),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
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
                              SizedBox(width: 6)
                            ]),
                        Divider(height: 0)
                      ])));
          break;
      }
    }

    return _getPost();
  }
}
