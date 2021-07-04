import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  Panel({this.title, this.type, this.img, this.openPage, this.facts});

  final String title;
  final AssetImage img;
  final Function openPage;
  final int type;
  final Map facts;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => openPage(title),
        child: Container(
            constraints: BoxConstraints(minHeight: 100),
            decoration: BoxDecoration(
                color: Color(0xfff6f5f1),
                borderRadius: BorderRadius.circular(16)),
            child: Stack(children: [
              Container(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    topLeft: Radius.circular(14))),
                            margin: const EdgeInsets.all(0),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                                child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(title,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                                fontSize: 18, height: 1.8)))))),
                    Expanded(
                        flex: 3,
                        child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 5, 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Fact(fact: "books: 714"),
                                  Fact(fact: "S: 253"),
                                  Fact(fact: "P: 188"),
                                  Fact(fact: "A: 273")
                                ])))
                  ])),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      child: IconButton(
                          icon: Icon(Icons.bookmark_border_rounded,
                              color: Theme.of(context).iconTheme.color),
                          iconSize: 16,
                          onPressed: () {})))
            ])));
  }
}

class Fact extends StatelessWidget {
  final String fact;

  const Fact({this.fact});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(fact,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontSize: 13, color: Theme.of(context).accentColor)),
      SizedBox(height: 10),
    ]);
  }
}
