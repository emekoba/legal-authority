import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
import 'package:legal_authority/Pages/WorkStation/EditorPage/EditorPage.dart';

class WorkStation extends StatefulWidget {
  final Function openSidebar;

  WorkStation({this.openSidebar});

  @override
  _WorkStationState createState() => _WorkStationState();

// body: Center(
//     child: Column(children: [
//   Text("curriculum"),
//   Text("notes"),
//   Text("class audio recordings"),
//   Text("exams, take quizzes we score you"),
//   Text("calender")
// ])),

}

class _WorkStationState extends State<WorkStation> {
  PageController _page = PageController();

  int _pageIndex = 0;

  void _changePage(int index) {
    _page.jumpToPage(index);

    setState(() => _pageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          PageHeader(
              title: "WORKSTATION",
              icon: Icons.edit_outlined,
              onLeadingIconTapped: widget.openSidebar),
          Expanded(
              child: PageView(
                  controller: _page,
                  children: [
                    Container(child: Center(child: Text(""))),
                    Container(child: Center(child: Text("tasks"))),
                    Container(child: Center(child: Text("curriculum"))),
                    EditorPage()
                  ],
                  onPageChanged: (index) => setState(() => _pageIndex = index)))
        ]),
        bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
                selectedItemColor: Theme.of(context).buttonColor,
                unselectedItemColor: Theme.of(context).accentColor,
                currentIndex: _pageIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      label: "snippets",
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Icon(Icons.short_text_rounded))),
                  BottomNavigationBarItem(
                      label: "tasks",
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Icon(Icons.markunread_mailbox_rounded))),
                  BottomNavigationBarItem(
                      label: "curriculum",
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Icon(Icons.calendar_today_rounded))),
                  BottomNavigationBarItem(
                      label: "editorPage",
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Icon(Icons.text_snippet_rounded)))
                ],
                onTap: (index) => _changePage(index))));
  }
}

//? drafts is inside the editorPage

//? set todos and set alarms for projects, events etc...
