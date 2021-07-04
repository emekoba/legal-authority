import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Media/Reader/SubSection.dart';

class Section extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          color: Colors.black,
          height: 30,
          width: 30,
          child: Center(
              child: Text("1",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Emporia")))),
      SubSection()
    ]));
  }
}
