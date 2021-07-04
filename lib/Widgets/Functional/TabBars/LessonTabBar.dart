import 'package:flutter/material.dart';

class LessonTabBar extends StatefulWidget {
  final PageController controller;

  const LessonTabBar({this.controller});

  @override
  _LessonTabBarState createState() => _LessonTabBarState();
}

class _LessonTabBarState extends State<LessonTabBar> {
  String _currentPage = "books";

  void _changePage(String page) {
    switch (page) {
      case "videos":
        setState(() => _currentPage = page);

        widget.controller.jumpToPage(2);

        break;

      case "audiobooks":
        setState(() => _currentPage = page);

        widget.controller.jumpToPage(1);

        break;

      case "books":
        setState(() => _currentPage = page);

        widget.controller.jumpToPage(0);

        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(width: 30),
      GestureDetector(
          onTap: () => _changePage("audiobooks"),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _currentPage == "audiobooks"
                      ? Theme.of(context).buttonColor
                      : Theme.of(context).accentColor),
              height: 32,
              width: 32,
              child: Icon(Icons.headset,
                  color: Theme.of(context).iconTheme.color, size: 20))),
      SizedBox(width: 10),
      GestureDetector(
          onTap: () => _changePage("books"),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _currentPage == "books"
                      ? Theme.of(context).buttonColor
                      : Theme.of(context).accentColor),
              height: 32,
              width: 32,
              child: Icon(Icons.book,
                  color: Theme.of(context).iconTheme.color, size: 20))),
      SizedBox(width: 10),
      GestureDetector(
          onTap: () => _changePage("videos"),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  color: _currentPage == "videos"
                      ? Theme.of(context).buttonColor
                      : Theme.of(context).accentColor),
              height: 32,
              width: 32,
              child: Icon(Icons.play_arrow,
                  color: Theme.of(context).iconTheme.color, size: 25))),
      SizedBox(width: 25),
    ]);
  }
}
