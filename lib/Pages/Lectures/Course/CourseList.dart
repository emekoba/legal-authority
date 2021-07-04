import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Lectures/LecturesBloc.dart';
import 'package:legal_authority/Pages/Lectures/Course/CoursePost.dart';
import 'package:legal_authority/Widgets/Functional/SearchBox.dart';
import 'package:legal_authority/Widgets/Functional/TabBars/SideTabBar.dart';
import 'package:provider/provider.dart';

class CourseList extends StatelessWidget {
  final Function openSidebar;

  CourseList(this.openSidebar);

  void _updateText() {}

  @override
  Widget build(BuildContext context) {
    LecturesBloc lecturesBloc = Provider.of<LecturesBloc>(context);

    FocusScopeNode _focus = FocusScope.of(context);

    bool _onScroll(dynamic t) {
      if (!_focus.hasPrimaryFocus) {
        _focus.unfocus();
      }

      return false;
    }

    return Column(children: [
      SearchBox(
          searchOntype: true,
          onChanged: _updateText,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0)),
      Expanded(
          child: Row(children: [
        Expanded(
            child: NotificationListener(
                onNotification: (dynamic t) => _onScroll(t),
                child: GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: lecturesBloc.courses.length,
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 20),
                    itemBuilder: (BuildContext context, int index) {
                      dynamic key = lecturesBloc.courses.keys.elementAt(index);

                      return CoursePost(
                          course: key.toString(),
                          lessons: lecturesBloc.courses[key]["lessons"] as Map);
                    }))),
        SideTabBar(tabs: lecturesBloc.letters, side: "top")
      ]))
    ]);
  }
}
