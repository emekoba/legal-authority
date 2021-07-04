import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:legal_authority/Pages/Lectures/Examination/Examination.dart';
import 'package:legal_authority/Widgets/Media/Reader/PdfView.dart';
import 'package:legal_authority/Widgets/Media/Reader/BulletPointView.dart';
import 'package:legal_authority/Widgets/Media/Reader/NoteView.dart';
import 'package:legal_authority/Widgets/Functional/SmallFab.dart';

class Reader extends StatelessWidget {
  String title;
  bool isPortion = false;
  String description;
  final String content;
  String caller; //? who is calling this class?
  String alignment; //? horizontal or verical..for pageview

  Reader(
      {this.caller,
      this.title,
      this.description,
      this.content,
      this.alignment});

  Reader.portion({this.content}) {
    this.isPortion = true;

    //? generate blocks based on these extra parameters
    //? content is still passed but this time it is different and smaller
  }

  Reader.script(
      {this.caller,
      this.title,
      this.description,
      this.content,
      this.alignment}) {
    // return script version
    //generate blocks based on these extra parameters
  }

  @override
  Widget build(BuildContext context) {
    return isPortion
        ? Portion(content: content)
        : Full(
            caller: caller,
            title: title,
            description: description,
            content: content,
            alignment: alignment);
  }
}

class Portion extends StatelessWidget {
  final String content;

  Portion({this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Text(
                  "get the exact snippet of the sentence that contains the word",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 20, height: 1.8, letterSpacing: 1.5)),
              // NoteView.portion()
            ])));
  }
}

class Full extends StatefulWidget {
  final String title;
  final bool isPortion = false;
  final String description;
  final String content;
  final String caller; // who is calling this class?
  final String alignment; // horizontal or verical..for pageview

  const Full(
      {this.caller,
      this.title,
      this.description,
      this.content,
      this.alignment});

  @override
  _FullState createState() => _FullState();
}

class _FullState extends State<Full> {
  final GlobalKey<ScaffoldState> _drawer = GlobalKey();
  PageController _page = PageController(initialPage: 0);
  Map<String, IconData> _modes = {
    "pdf": Icons.picture_as_pdf_rounded,
    "script": Icons.menu_book_rounded,
    "bullet point": Icons.format_list_bulleted,
  };
  String _mode = "pdf";
  bool _fabShown = true;
  int _pageIndex = 0;
  bool _hasBulletPoints = true;

  void _changePage(int index) {
    _page.jumpToPage(index);

    setState(() {
      if (index == 1) {
        _fabShown = false;
      }

      _pageIndex = index;
    });
  }

  void _goToExams() {
    Navigator.push(
        context,
        MaterialPageRoute<Widget>(
            builder: (context) =>
                Examination(course: widget.description, lesson: widget.title)));
  }

  void _toggleFabShown() {
    setState(() => _fabShown = !_fabShown);
  }

  void _closeFab() {
    if (_fabShown) {
      setState(() {
        _fabShown = false;
      });
    }
  }

  void _toggleMode() {
    switch (_mode) {
      case "pdf":
        setState(() => _mode = "script");
        break;

      case "script":
        if (_hasBulletPoints) {
          setState(() => _mode = "bullet point");
        } else {
          setState(() => _mode = "pdf");
        }
        break;

      case "bullet point":
        setState(() => _mode = "pdf");
        break;
    }
  }

  void _openSettings() {
    showModalBottomSheet<Widget>(
        backgroundColor: Theme.of(context).primaryColor,
        context: context,
        builder: (_) {
          return Container();
        });
  }

  void _openDrawer() {
    _drawer.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      floatingActionButton: Offstage(
          offstage: !_fabShown,
          child: Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      SizedBox(height: 68),
                      SmallFab(
                          tip: "open drawer",
                          icon: Icons.menu,
                          func: _openDrawer),
                      SmallFab(
                          tip: "settings",
                          icon: Icons.settings,
                          func: _openSettings)
                    ]),
                    Column(children: [
                      SmallFab(
                          tip: _mode, icon: _modes[_mode], func: _toggleMode),
                      Offstage(
                          offstage: widget.caller != "lectures",
                          child: SmallFab(
                              tip: "start test",
                              icon: Icons.timer,
                              func: _goToExams))
                    ]),
                  ]))),
      body: SafeArea(
          child: Stack(children: [
        PageView(
            controller: _page,
            scrollDirection: Axis.vertical,
            onPageChanged: (index) => _changePage(index),
            children: [
              Cover(widget.title, widget.description),
              _mode == "pdf"
                  ? PdfView()
                  : _mode == "script"
                      ? NoteView(closeFab: _closeFab)
                      : BulletPointView()
            ]),
        Offstage(
            offstage: !_fabShown,
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                    shape: CircleBorder(),
                    color: Theme.of(context).buttonColor,
                    onPressed: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back,
                        size: 15, color: Theme.of(context).iconTheme.color)))),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(15))),
                child: RotatedBox(
                    quarterTurns: _fabShown ? 3 : 4,
                    child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(FontAwesomeIcons.solidArrowAltCircleLeft,
                            color: Theme.of(context).iconTheme.color),
                        iconSize: 15,
                        onPressed: _toggleFabShown))))
      ])),
    );
  }
}

class Cover extends StatelessWidget {
  Cover(this.title, this.description);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Row(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 50, 30),
              child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(title == null ? "" : title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontSize: 25)))),
          Expanded(
              child: Container(
                  color: Color(0xfff6f5f1),
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(30),
                  child: Text("",
                      // description == null ? "" : description,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor))))
        ]));
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //TODO: change orientation of the reader....script, bullet, pdf
        );
  } //? option to turn off hyperlinks in noteview....
}

//? when saving stuff to workstation write "saved "entry" as snippet to workstation"

//? if entry or else saved as draft, or other stuff...
