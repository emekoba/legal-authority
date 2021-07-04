import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Lectures/Examination/Examination.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonList/LessonListReadersList/LessonListReadersList.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonList/LessonListAudioList.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonList/LessonListVideoList.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
import 'package:legal_authority/Widgets/Functional/SearchBox.dart';
import 'package:legal_authority/Widgets/Functional/TabBars/LessonTabBar.dart';

class LessonList extends StatelessWidget {
  final String course;
  final Map lessons;

  LessonList({this.course, this.lessons});

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();

    void _dismissInput() {
      final FocusScopeNode _focus = FocusScope.of(context);

      if (!_focus.hasPrimaryFocus) {
        _focus.unfocus();
      }
    }

    List<Widget> _pages = [
      LessonListReadersList(
          course: course, lessons: lessons, dismissInput: _dismissInput),
      AudioList(dismissInput: _dismissInput),
      VideoList(dismissInput: _dismissInput),
    ];

    void _goToExams() {
      Navigator.push(
          context,
          MaterialPageRoute<Widget>(
              builder: (context) =>
                  Examination.all(course: course, allLessons: lessons)));
    }

    return Scaffold(
        floatingActionButton: Padding(
            padding: EdgeInsets.only(right: 10, bottom: 20),
            child: Tooltip(
                message: "start test",
                preferBelow: false,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(bottom: 10),
                child: FloatingActionButton(
                    heroTag: null,
                    onPressed: _goToExams,
                    child: Icon(Icons.timer,
                        color: Theme.of(context).iconTheme.color),
                    backgroundColor: Theme.of(context).buttonColor))),
        body: SafeArea(
            child: Column(children: [
          PageHeader(
              title: "$course${course.contains("Law") ? "" : " Law "}",
              icon: Icons.arrow_back,
              onLeadingIconTapped: () => Navigator.pop(context),
              titleStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Theme.of(context).accentColor),
              endWidget: LessonTabBar(controller: _pageController)),
          SearchBox(),
          Expanded(
              child: PageView.builder(
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (ctxt, pos) => _pages[pos]))
        ])));
  }
}
