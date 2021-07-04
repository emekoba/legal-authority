import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  final String question;
  final String hint;
  dynamic answers;
  final Function chooseAnswer;
  bool stopTap;

  Test(
      {this.question,
      this.hint,
      this.answers,
      this.chooseAnswer,
      this.stopTap});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  bool _hintOpen = false;

  void _toggleHint() {
    setState(() {
      _hintOpen = !_hintOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Container(
                child: Text(widget.question.toString(),
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 18, letterSpacing: 1.5, height: 1.5)))),
        Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(children: [
              ...widget.answers.entries
                  .map((dynamic e) => AnswerBtn(
                      widget.question,
                      e.key.toString(),
                      e.value["isChosen"],
                      e.value["isCorrect"],
                      widget.chooseAnswer,
                      widget.stopTap))
                  .toList()
            ]))
      ]),
      Positioned(
          bottom: 0,
          right: 0,
          child: Container(
              alignment: Alignment.centerRight,
              child: HintPage(widget.hint, _hintOpen, _toggleHint)))
    ]);
  }
}

class AnswerBtn extends StatelessWidget {
  AnswerBtn(this.question, this.answer, this.isChosen, this.isCorrect,
      this.chooseAnswer, this.stopTap);

  final String question;
  final String answer;
  final dynamic isChosen;
  final dynamic isCorrect;
  final Function chooseAnswer;
  bool stopTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!stopTap) {
            chooseAnswer(question, answer);
          }
        },
        child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            constraints: BoxConstraints(minHeight: 70),
            child: Stack(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 10, 15),
                  child: Text(answer,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 13,
                          letterSpacing: 1.5,
                          color: Colors.black))),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Offstage(
                      offstage: isChosen != true,
                      child: Material(
                          elevation: 5,
                          color: isChosen == true
                              ? isCorrect == true
                                  ? Colors.green
                                  : Colors.red
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                  isCorrect == true ? Icons.check : Icons.close,
                                  color: Colors.white)))))
            ])));
  }
}

class HintPage extends StatelessWidget {
  const HintPage(this.hint, this.isOpen, this.toggleHint);

  final String hint;
  final bool isOpen;
  final Function toggleHint;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleHint(),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          alignment: Alignment.centerRight,
          height: isOpen ? MediaQuery.of(context).size.height - 150 : 40,
          width: isOpen ? MediaQuery.of(context).size.width : 60,
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isOpen ? 0 : 20),
                  bottomLeft: Radius.circular(isOpen ? 0 : 20))),
          child: Center(
              child: Text("hint",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 12,
                        //  color: Theme.of(context).buttonColor
                      )))),
    );
  }
}
