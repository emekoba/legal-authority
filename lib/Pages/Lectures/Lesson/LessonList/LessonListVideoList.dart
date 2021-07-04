import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Lectures/Lesson/LessonPost/LessonPost.dart';
import 'package:legal_authority/Widgets/Functional/TabBars/SideTabBar.dart';

class VideoList extends StatelessWidget {
  final Function dismissInput;

  VideoList({this.dismissInput});

  PageController _pages = PageController();
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SideTabBar(
          fontColor: Theme.of(context).accentColor,
          uppercase: true,
          tabs: <String>["lessons", "webvids"],
          control: _pages),
      Expanded(
          child: PageView(
              controller: _pages,
              physics: NeverScrollableScrollPhysics(),
              children: [Container(), WebVid(dismissInput: dismissInput)]))
    ]);
  }
}

class WebVid extends StatefulWidget {
  final Function dismissInput;

  WebVid({this.dismissInput});

  @override
  _WebVidState createState() => _WebVidState();
}

class _WebVidState extends State<WebVid>
    with AutomaticKeepAliveClientMixin<WebVid> {
  String _link =
      "https://www.youtube.com/watch?v=0ViSYjt-wGw&ab_channel=HeshamElrafei";

  String _link2 =
      "https://www.youtube.com/watch?v=byczmeYHCyE&ab_channel=LawShelf";

  @override
  Widget build(BuildContext context) {
    super.build(context);

    bool _onScroll(dynamic t) {
      widget.dismissInput();

      return false;
    }

    return NotificationListener(
        onNotification: (dynamic t) => _onScroll(t),
        child: ListView(children: [
          LessonPost.video(lesson: _link),
          LessonPost.video(lesson: _link2),
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}
