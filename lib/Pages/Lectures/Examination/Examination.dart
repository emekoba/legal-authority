import 'dart:async';
import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Lectures/Examination/Primer/Primer.dart';
import 'package:legal_authority/Pages/Lectures/Examination/ScoreSheet.dart';
import 'package:legal_authority/Pages/Lectures/Examination/Test/Test.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/Pages/Lectures/LecturesBloc.dart';

class Examination extends StatefulWidget {
  final String course;
  String lesson;
  Map allLessons;

  Examination({this.course, this.lesson});

  Examination.all({this.course, this.allLessons});

  @override
  _ExaminationState createState() => _ExaminationState();
}

class _ExaminationState extends State<Examination> {
  PageController _pageControl = PageController(initialPage: 0);

  Duration _testSpeed = Duration(seconds: 1);

  Timer timerController;

  int _overallScore = 0;

  int _timer = 0;

  int _currentPageIndex = 0;

  Color _valueColor = Colors.green;

  Color _skippedColor;

  bool _pause = false;

  bool _stopTap = false;

  bool _beforeExam = true;

  Map _settings = <String, dynamic>{"numberOfTestsToTry": 0, "timeLimit": 100};

  List<String> _failedTests = [];

  List<String> _passedTests = [];

  List<String> _skippedTests = [];

  Map _tests = <String, Map>{};

  void _restartTimer() {
    setState(() => _timer = 0);
  }

  void _updateTimer() {
    timerController = Timer.periodic(_testSpeed, (time) {
      if (_settings["numberOfTestsToTry"] as int == _currentPageIndex) {
        //? if the page changes to an index greater than the number of questions set,the exam ends

        time.cancel();

        _stopExam();
      } else {
        //? keep counting...

        if (_timer == _settings["timeLimit"] as int) {
          //? if timelimit is exceeded, restart the timer

          _restartTimer();

          _scoreTest(null, null);
        } else {
          //? add one to timer

          if (!_pause) {
            setState(() => _timer = _timer + 1);
          }
        }
      }
    });
  }

  void _scoreTest(String question, String answer) {
    void _pass(String question) {
      setState(() {
        _overallScore = _overallScore + 1;

        _passedTests.add(question);

        _valueColor = Colors.green;
      });
    }

    void _fail(String question) {
      setState(() {
        _failedTests.add(question);

        _valueColor = Colors.red;
      });
    }

    if (question != null || answer != null) {
      bool pass = false;

      _tests.forEach((dynamic key, dynamic value) {
        if (key == question) {
          if (value["answers"][answer]["isCorrect"] == true) {
            pass = true;
          }
        }
      });

      if (pass) {
        _pass(question);
      } else {
        _fail(question);
      }
    } else {
      setState(() {
        _valueColor = _skippedColor;

        _skippedTests.add(question);
      });
    }

    _nextTest();
  }

  void _nextTest() {
    if (!_beforeExam) {
      if (_settings["numberOfTestsToTry"] as int > _currentPageIndex + 1) {
        _pageControl.animateToPage(_pageControl.page.toInt() + 1,
            duration: Duration(microseconds: 500), curve: Curves.bounceIn);
      }

      setState(() => _currentPageIndex = _pageControl.page.toInt() + 1);

      _restartTimer();
    }
  }

  void _randomizeTests() {
    // google randomize Map entries....

    // randomize answers too....
  }

  void _clearAnswers() {
    _tests.forEach((dynamic key, dynamic value) {
      setState(() {
        value["answers"].forEach((String key, Map value) {
          value["isChosen"] = false;
        });
      });
    });
  }

  void _restartExam() {
    _randomizeTests();

    _pageControl.jumpToPage(0);

    setState(() {
      _currentPageIndex = 0;
      _valueColor = Colors.grey;
      _overallScore = 0;
      _passedTests = [];
      _failedTests = [];
      _skippedTests = [];
      _stopTap = false;
    });

    _tests.forEach((dynamic key, dynamic value) {
      setState(() {
        value["answers"].forEach((String key, Map value) {
          value["isChosen"] = false;
        });
      });
    });

    _restartTimer();
    _updateTimer();
  }

  void _chooseAnswer(String question, String answer) {
    _tests.forEach((dynamic key, dynamic value) {
      if (key == question) {
        setState(() {
          value["answers"].forEach((String key, Map value) {
            value["isChosen"] = false;
          });

          value["answers"][answer]["isChosen"] = true;
        });
      }
    });

    Timer.periodic(Duration(milliseconds: 300), (timer) {
      _restartTimer();
      _scoreTest(question, answer);

      timer.cancel();
    });
  }

  void _goToPrimer() {
    setState(() {
      _beforeExam = true;
    });
  }

  void _startExam(int primer_numOfTests, int primer_timeLimit) {
    _randomizeTests();

    setState(() {
      _settings["numberOfTestsToTry"] = primer_numOfTests;
      _settings["timeLimit"] = primer_timeLimit;

      _currentPageIndex = 0;
      _pause = false;
      _beforeExam = false;

      _stopTap = false;
    });

    _updateTimer();
  }

  void _stopExam() {
    setState(() {
      _stopTap = true;
    });

    showModalBottomSheet<Widget>(
        backgroundColor: Theme.of(context).primaryColor,
        context: context,
        builder: (_) {
          return ScoreSheet.brief(
              _overallScore, _passedTests, _failedTests, _restartExam);
        });
  }

  void _pause_continue_Exam() {
    setState(() {
      _pause = !_pause;
      _stopTap = !_stopTap;
    });
  }

  void _closeExam() {
    timerController.cancel();

    _clearAnswers();

    setState(() {
      _timer = 0;
      _valueColor = Colors.grey;
      _overallScore = 0;
      _passedTests = [];
      _failedTests = [];
      _skippedTests = [];
    });

    _goToPrimer();
  }

  @override
  void initState() {
    setState(() {
      Future.delayed(Duration.zero, () {
        _skippedColor = Theme.of(context).buttonColor;
      });
    });

    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final LecturesBloc lecturesBloc = Provider.of<LecturesBloc>(context);

    () {
      Map superExam = <String, Map>{};

      if (widget.lesson == null) {
        //? load all exams from all lessons to super exam

        lecturesBloc.courses[widget.course]["lessons"]
            .forEach((String key, dynamic value) {
          if (value["examination"].isEmpty as bool) {
          } else {
            value["examination"].forEach((String key, dynamic value) {
              superExam[key] = value as Map;
            });
          }
          _tests = superExam;
        });
      } else {
        _tests = lecturesBloc.courses[widget.course]["lessons"][widget.lesson]
            ["examination"] as Map;
      }
    }();
    //? init_exams.....

    return WillPopScope(
      onWillPop: () async {
        _clearAnswers();
        return true;
      },
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          floatingActionButton: Offstage(
              offstage: _beforeExam,
              child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FloatingActionButton(
                      heroTag: null,
                      onPressed: () {},
                      child: Text(_timer.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontSize: 15)),
                      backgroundColor: Theme.of(context).accentColor))),
          body: SafeArea(
              child: _beforeExam
                  ? Primer(
                      course: widget.course,
                      lesson: widget.lesson,
                      lessons: widget.allLessons,
                      settings: _settings,
                      totalNumberOfTests: _tests.length,
                      startExam: _startExam)
                  : Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RaisedButton(
                                    shape: CircleBorder(),
                                    color: Theme.of(context).buttonColor,
                                    onPressed: _closeExam,
                                    child: Icon(Icons.close,
                                        size: 15,
                                        color:
                                            Theme.of(context).iconTheme.color)),
                                GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).buttonColor),
                                      child: Icon(Icons.settings,
                                          size: 15,
                                          color: Theme.of(context)
                                              .iconTheme
                                              .color),
                                    )),
                                SizedBox(width: 20),
                                GestureDetector(
                                    onTap: _pause_continue_Exam,
                                    child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Theme.of(context).buttonColor),
                                        child: Tooltip(
                                          message:
                                              "${_pause ? "continue" : "pause"}",
                                          child: Icon(
                                              _pause
                                                  ? Icons.play_arrow_rounded
                                                  : Icons.pause,
                                              size: _pause ? 18 : 15,
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color),
                                        ))),
                                SizedBox(width: 20),
                                Tooltip(
                                    message: "restart",
                                    child: GestureDetector(
                                        onTap: _restartExam,
                                        child: Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Theme.of(context)
                                                    .buttonColor),
                                            child: Icon(Icons.redo_rounded,
                                                size: 15,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color)))),
                                SizedBox(width: 40),
                                Expanded(
                                    child: Text(
                                        "${_currentPageIndex}/${_settings["numberOfTestsToTry"]}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(fontSize: 15)))
                              ])),
                      Expanded(
                          child: PageView(
                              physics: NeverScrollableScrollPhysics(),
                              controller: _pageControl,
                              children: _tests.entries
                                  .map((e) => Test(
                                      stopTap: _stopTap,
                                      question: e.key.toString(),
                                      hint: e.value["hint"].toString(),
                                      answers: e.value["answers"],
                                      chooseAnswer: _chooseAnswer))
                                  .toList())),
                      SizedBox(height: 30),
                      Container(
                          height: 30,
                          child: LinearProgressIndicator(
                              value: _currentPageIndex * 0.2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(_valueColor),
                              backgroundColor: Theme.of(context).accentColor))
                    ]))),
    );
  }
}

//todo: a new method of administering tests...sentence with spaces and a massive well
//todo: of words at the bottom that then allow for you to choose words that fit into
//todo: those boxes that will appropraitely answer the question...

//todo: find out how to collapse modal on button press

//? download dart dev tools
