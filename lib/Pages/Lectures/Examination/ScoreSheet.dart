import 'package:flutter/material.dart';

class ScoreSheet extends StatelessWidget {
  const ScoreSheet(this.total, this.passed, this.failed, this.restart);

  const ScoreSheet.brief(this.total, this.passed, this.failed, this.restart);

  final int total;
  final List failed;
  final List passed;
  final Function restart;

  @override
  Widget build(BuildContext context) {
    void _restartExam() {
      Navigator.pop(context);

      restart();
    }

    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              alignment: Alignment.center,
              child: Text(total.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 40))),
          RaisedButton(
              onPressed: _restartExam,
              child: Text(
                "restart",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 12, color: Colors.black),
              )),
          SizedBox(height: 30),
          Text("Speed :  ${total.toString()}",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 20, color: Theme.of(context).buttonColor)),
          SizedBox(height: 40),
          Text("Passed :",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 20, color: Theme.of(context).buttonColor)),
          Divider(height: 30),
          ...passed.map((dynamic e) => Text(e.toString())).toList(),
          SizedBox(height: 50),
          Text("Failed :",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 20, color: Theme.of(context).buttonColor)),
          Divider(height: 30),
          ...failed.map((dynamic e) => Text(e.toString())).toList()
        ]));
  }
}
