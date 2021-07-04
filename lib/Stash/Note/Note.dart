import 'package:flutter/material.dart';
import 'package:legal_authority/Stash/Note/BulletPoint.dart';

class Note extends StatelessWidget {
  final String lesson;
  final bool isBulleted;

  Note({this.isBulleted, this.lesson});

  @override
  Widget build(BuildContext context) {
    return isBulleted
        ? Column(children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Text("Withholding tax".toUpperCase(),
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
            ...List.generate(10, (index) => BulletPoint(point: "hey"))
          ])
        : Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Withholding tax".toUpperCase(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              Container(child: Text("full notes, blach blah, blahjfsoiuvhifje"))
            ]));
  }
}

// Widget header() {}

// Widget subHeader() {}
