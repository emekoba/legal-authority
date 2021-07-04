import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonPost/LessonPost.dart';

class Lessons extends StatefulWidget {
  final String course;
  final Map lessons;
  final Function dismissInput;

  Lessons({this.course, this.lessons, this.dismissInput});

  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons>
    with AutomaticKeepAliveClientMixin<Lessons> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    bool _onScroll(dynamic t) {
      widget.dismissInput();

      return false;
    }

    return NotificationListener(
        onNotification: (dynamic t) => _onScroll(t),
        child: ListView.builder(
            itemCount: widget.lessons.length,
            itemBuilder: (context, index) {
              dynamic key = widget.lessons.keys.elementAt(index);

              return LessonPost.papers(
                  course: widget.course,
                  lesson: key.toString(),
                  description: widget.lessons[key]["description"].toString());
            }));
  }

  @override
  bool get wantKeepAlive => true;
}
