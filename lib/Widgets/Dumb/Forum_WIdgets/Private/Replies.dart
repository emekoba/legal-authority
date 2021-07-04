import 'package:flutter/material.dart';

class Replies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Divider(
        height: 0,
        // color: Colors.amberAccent
      ),
      InkWell(
          onTap: () {},
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Baron Emekoba",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(fontSize: 12)),
                          SizedBox(width: 20),
                          FittedBox(
                              child: CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: AssetImage(
                                      "lib/Resources/Profile/Profile2.jpg"),
                                  minRadius: 10))
                        ]),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        constraints: BoxConstraints(minHeight: 100),
                        child: Text("", style: TextStyle(fontSize: 11))),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Text("7h", style: TextStyle(fontSize: 10)),
                      SizedBox(width: 20),
                      Text("Unical Class of 2018",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontSize: 12))
                    ])
                  ]))),
    ]);
  }
}
