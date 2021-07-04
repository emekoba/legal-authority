import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Lectures/LecturesBloc.dart';
import 'package:legal_authority/Widgets/Media/AudioPlayer.dart';
import 'package:legal_authority/Widgets/Media/Reader/Reader.dart';
import 'package:legal_authority/Widgets/Media/VideoPlayer.dart';
import 'package:legal_authority/Widgets/Media/WebViewer.dart';
import 'package:provider/provider.dart';

class LessonPage extends StatelessWidget {
  final String course;
  final String lesson;
  String form;

  LessonPage.papers({this.course, this.lesson}) {
    form = "papers";
  }

  LessonPage.video({this.course, this.lesson}) {
    form = "video";
  }

  LessonPage.audio({this.course, this.lesson}) {
    form = "audio";
  }

  LessonPage.web({this.course, this.lesson}) {
    form = "web";
  }

  @override
  Widget build(BuildContext context) {
    final LecturesBloc lecturesBloc = Provider.of<LecturesBloc>(context);

    //todo: here we will register and store history of visits for recent lessons
    //todo: based on the form...

    Widget _getPage() {
      switch (form) {
        case "papers":
          lecturesBloc.updateRecentLessons(course: course, lesson: lesson);

          return Reader(caller: "lectures", title: lesson, description: course);
          break;

        case "video":
          lecturesBloc.updateRecentVideoLessons(course: course, lesson: lesson);

          return VideoPlayer();
          break;

        case "audio":
          return AudioPlayer();
          break;

        case "web":
          return WebViewer();
          break;

        default:
          return Offstage();
      }
    }

    return _getPage();
  }
}
