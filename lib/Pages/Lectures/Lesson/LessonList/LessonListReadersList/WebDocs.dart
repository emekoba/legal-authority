import 'package:flutter/material.dart';
import 'package:flutter_link_preview/flutter_link_preview.dart';

class WebDocs extends StatefulWidget {
  final Function dismissInput;

  WebDocs({this.dismissInput});

  @override
  _WebDocsState createState() => _WebDocsState();
}

class _WebDocsState extends State<WebDocs>
    with AutomaticKeepAliveClientMixin<WebDocs> {
  String _link =
      "https://en.wikipedia.org/wiki/Relevance_(law)#:~:text=%22Relevant%20evidence%22%20means%20evidence%20having,would%20be%20without%20the%20evidence.";

  String _link2 = "https://en.wikipedia.org/wiki/Evidence_(law)";

  bool _inLibrary = false;

  void _saveToLibrary() {}

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget _defaultPost(String link) {
      return Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                      width: 5, color: Theme.of(context).buttonColor))),
          child: InkWell(
              onTap: () {},
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(height: 0),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
                        constraints: BoxConstraints(minHeight: 80),
                        child: Column(children: [
                          FlutterLinkPreview(
                              url: link,
                              titleStyle: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontSize: 15),
                              bodyStyle: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontSize: 13, color: Colors.grey))
                        ])),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                                          : Icons.bookmark_border_rounded,
                                      color: Theme.of(context).buttonColor,
                                      size: 16)))),
                      SizedBox(width: 6)
                    ]),
                    Divider(height: 0)
                  ])));
    }

    bool _onScroll(dynamic t) {
      widget.dismissInput();

      return false;
    }

    return NotificationListener(
        onNotification: (dynamic t) => _onScroll(t),
        child: ListView(children: [
          _defaultPost(_link2),
          _defaultPost(_link),
          _defaultPost("https://www.quora.com/What-is-law-and-its-importance"),
          _defaultPost("https://linkedIn.com"),
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}
