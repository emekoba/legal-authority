import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonList/LessonListReadersList/Articles.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonList/LessonListReadersList/Books.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonList/LessonListReadersList/Lessons.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonList/LessonListReadersList/WebDocs.dart';
import 'package:legal_authority/Widgets/Functional/TabBars/SideTabBar.dart';

class LessonListReadersList extends StatelessWidget {
  final String course;
  final Map lessons;
  final Function dismissInput;

  LessonListReadersList({this.course, this.lessons, this.dismissInput});

  PageController _pages = PageController();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SideTabBar(
          fontColor: Theme.of(context).accentColor,
          uppercase: true,
          tabs: <String>["lessons", "articles", "webdocs", "books"],
          control: _pages),
      Expanded(
          child: PageView(
              controller: _pages,
              physics: NeverScrollableScrollPhysics(),
              children: [
            Lessons(
                lessons: lessons, course: course, dismissInput: dismissInput),
            Articles(dismissInput: dismissInput),
            WebDocs(dismissInput: dismissInput),
            Books(dismissInput: dismissInput)
          ]))
    ]);
  }
}
