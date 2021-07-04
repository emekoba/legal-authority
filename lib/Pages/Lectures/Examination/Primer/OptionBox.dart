import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  final String textBefore;
  final Widget uniqueWidget;
  final int optionLimit;
  final Function func;
  final int hintText;

  const OptionBox(
      {this.textBefore,
      this.optionLimit,
      this.uniqueWidget,
      this.func,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 5, 0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(textBefore,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontSize: 20, letterSpacing: 1.5)),
          uniqueWidget ??
              Stack(children: [
                Container(
                    height: 100,
                    width: 120,
                    padding: EdgeInsets.all(20),
                    // color: Colors.red,
                    child: Container(
                        height: 60,
                        width: 60,
                        padding: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                            onChanged: (String value) => func(int.parse(value)),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 25),
                            decoration: InputDecoration(
                                hintText: hintText.toString(),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontSize: 25,
                                        color: Theme.of(context).primaryColor),
                                border: InputBorder.none)))),
                Positioned(
                    right: 10,
                    top: 10,
                    child: Offstage(
                        offstage: optionLimit == null,
                        child: Container(
                            height: 20,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(optionLimit.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          fontSize: 12,
                                          color:
                                              Theme.of(context).primaryColor)),
                            ))))
              ])
        ]));
  }
}
