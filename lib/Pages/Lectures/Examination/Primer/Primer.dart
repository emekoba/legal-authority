import 'package:flutter/material.dart';
import 'OptionBox.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';

class Primer extends StatefulWidget {
  final String course;
  final String lesson;
  final Map lessons;
  final Function startExam;
  final int totalNumberOfTests;
  final Map settings;

  const Primer(
      {this.course,
      this.lesson,
      this.startExam,
      this.totalNumberOfTests,
      this.settings,
      this.lessons});

  @override
  _PrimerState createState() => _PrimerState();
}

class _PrimerState extends State<Primer> {
  int _timeLimit;
  int _numOfTestsToTry;

  void _setTimeLimit(int limit) {
    setState(() => _timeLimit = limit);
  }

  void _setNumberOfTests(int number) {
    setState(() => _numOfTestsToTry = number);
  }

  @override
  void initState() {
    setState(() {
      if (widget.settings["numberOfTestsToTry"] as int == 0) {
        _numOfTestsToTry = widget.totalNumberOfTests;
      } else {
        _numOfTestsToTry = widget.settings["numberOfTestsToTry"] as int;
      }

      if (widget.settings["timeLimit"] as int == null) {
        _timeLimit = 100;
      } else {
        _timeLimit = widget.settings["timeLimit"] as int;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _lessonTextStyle = Theme.of(context)
        .textTheme
        .headline6
        .copyWith(fontSize: 17, height: 1.5);

    void _dismissInput() {
      FocusScopeNode _focus = FocusScope.of(context);

      if (!_focus.hasPrimaryFocus) {
        _focus.unfocus();
      }
    }

    void _goToExamination() {
      if (_numOfTestsToTry > widget.totalNumberOfTests) {
        showDialog<Widget>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Theme.of(context).primaryColor,
                    title: Text(
                        "your choice for 'number of tests' exceeded the limit",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 14, color: Colors.redAccent)),
                    content: Text("reduce the 'number of tests' field to start",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 15)),
                    actions: [
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("ok"))
                    ]));
      } else {
        widget.startExam(_numOfTestsToTry, _timeLimit);
      }
    }

    return GestureDetector(
        onTap: _dismissInput,
        child: Scaffold(
            floatingActionButton: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: FloatingActionButton.extended(
                    onPressed: _goToExamination,
                    backgroundColor: Theme.of(context).buttonColor,
                    label: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("start",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Theme.of(context).primaryColor)),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_ios_rounded,
                              size: 15, color: Theme.of(context).primaryColor)
                        ]))),
            body: SafeArea(
                child: Stack(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                PageHeader(
                    titleStyle: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 16, color: Theme.of(context).accentColor),
                    title:
                        "${widget.course}${widget.course.contains("Law") ? "" : " Law "}Test",
                    icon: Icons.arrow_back,
                    onLeadingIconTapped: () => Navigator.pop(context)),
                Expanded(
                    child: ListView(children: [
                  widget.lesson == null
                      ? Container(
                          constraints: BoxConstraints(maxHeight: 300),
                          padding: EdgeInsets.fromLTRB(10, 25, 25, 50),
                          child: ListView.builder(
                              itemCount: widget.lessons.length,
                              itemBuilder: (BuildContext context, int index) {
                                dynamic key =
                                    widget.lessons.keys.elementAt(index);

                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("-", style: _lessonTextStyle),
                                            SizedBox(width: 10),
                                            Flexible(
                                                child: Text(key.toString(),
                                                    style: _lessonTextStyle))
                                          ]),
                                      SizedBox(height: 20)
                                    ]);
                              }))
                      : Padding(
                          padding: EdgeInsets.fromLTRB(25, 25, 25, 50),
                          child: Text(widget.lesson,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontSize: 40, height: 1.5))),
                  OptionBox(
                      textBefore: "number of tests :",
                      hintText: _numOfTestsToTry,
                      func: _setNumberOfTests,
                      optionLimit: widget.totalNumberOfTests),
                  OptionBox(
                      textBefore: "timer (per test) :",
                      hintText: _timeLimit,
                      func: _setTimeLimit),
                  SizedBox(height: 200)
                ]))
              ]),
              // Positioned(
              //     top: 0,
              //     right: 10,
              //     child: Container(
              //         height: 55,
              //         width: 40,
              //         alignment: Alignment.bottomCenter,
              //         decoration: BoxDecoration(
              //             color: Theme.of(context).buttonColor,
              //             borderRadius: BorderRadius.only(
              //                 bottomRight: Radius.circular(15),
              //                 bottomLeft: Radius.circular(20))),
              //         child: IconButton(
              //             icon: Icon(Icons.bookmark_border_rounded,
              //                 color: Theme.of(context).iconTheme.color),
              //             iconSize: 20,
              //             onPressed: () {})))
            ]))));
  }
}
